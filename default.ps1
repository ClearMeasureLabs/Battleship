Framework "4.6"

properties {
    $projectName = "Battleship"
    $base_dir = resolve-path .\
    $source_dir = "$base_dir\src"
    $unitTestAssembly = "Battleship.Ascii.Tests.dll"
    $integrationTestAssembly = "Battleship.GameController.Tests.dll"
    $acceptanceTestAssembly = "Battleship.AcceptanceTests.dll"
	$projectConfig = $env:Configuration
    $version = $env:Version
    $nunitPath = Resolve-Path("$source_dir\packages\NUnit.Console*\Tools")
	$testCopyIgnorePath = "packages"

    $build_dir = "$base_dir\build"
    $test_dir = "$build_dir\test"
    $package_dir = "$build_dir\package"	
    $package_file = "$build_dir\latestVersion\" + $projectName + "_Package.zip"
    $runOctoPack = $env:RunOctoPack

	$vs2017_dir = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise";
    $vstest_dir = "$vs2017_dir\Common7\IDE\CommonExtensions\Microsoft\TestWindow"
    $testresults_dir = "$base_dir\TestResults"

    if ([string]::IsNullOrEmpty($version)) { $version = "1.0.0"}
    if ([string]::IsNullOrEmpty($projectConfig)) {$projectConfig = "Release"}
}

task default -depends Init, Compile, Test
task ci -depends Init, Compile, Test

task Init {
    Write-Host("##[section]Starting: Build task 'Init'")
    delete_file $package_file
    rd $build_dir -recurse -force  -ErrorAction Ignore
    rd $testresults_dir -recurse -force -ErrorAction Ignore
   
    create_directory $test_dir
    create_directory $build_dir

    Write-Host $projectConfig
    Write-Host $version
    Write-Host("##[section]Finishing: Build task 'Init'")
}

task Compile -depends Init {
    Write-Host("##[section]Starting: Build task 'Compile'")
    exec {
        & tools\SonarQube.Scanner.MSBuild.exe begin /k:"BattleshipProject" /d:sonar.organization="jeffrey-clear-measure-com-micros" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="f893f6c7a0ce626ca81f5148d3487fed5bfa1eba"
        & 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe' /t:Clean`;Rebuild /v:m /maxcpucount:1 /nologo /p:RunCodeAnalysis=true /p:ActiveRulesets=MinimumRecommendedRules.ruleset /p:Configuration=$projectConfig $source_dir\$projectName.sln
        & tools\SonarQube.Scanner.MSBuild.exe end /d:sonar.login="f893f6c7a0ce626ca81f5148d3487fed5bfa1eba"
    }

    #

    Copy_and_flatten $source_dir *.nupkg $build_dir
    Write-Host("##[section]Finishing: Build task 'Compile'")
}

task Test -depends Compile {
    Write-Host("##[section]Starting: Build task 'Test'")
    copy_all_assemblies_for_test $test_dir
    exec {
        & $nunitPath\nunit3-console.exe $test_dir\$unitTestAssembly $test_dir\$integrationTestAssembly --workers=1 --noheader --result="$build_dir\TestResult.xml"`;format=nunit2
    }
    Write-Host("##[section]Finishing: Build task 'Test'")
}

task AcceptanceTest {
	Write-Host("##[section]Starting: Build task 'AcceptanceTest'")
    copy_all_assemblies_for_test $test_dir
	exec {
        & $nunitPath\nunit3-console.exe $test_dir\$acceptanceTestAssembly --workers=1 --noheader --result="$build_dir\AcceptanceTestResult.xml"`;format=nunit2 --out="$build_dir\AcceptanceTestResult.txt"
	}
	Write-Host("##[section]Finishing: Build task 'AcceptanceTest'")
}

task CodeCoverage {
    Write-Host("##[section]Starting: Build task 'CodeCoverage'")
    copy_all_assemblies_for_test $test_dir
    exec {
        & $vstest_dir\vstest.console.exe $test_dir\$unitTestAssembly $test_dir\$integrationTestAssembly /TestAdapterPath:$test_dir /Logger:trx /Enablecodecoverage /Settings:$source_dir\CodeCoverage.runSettings
    }
    Write-Host("##[section]Finishing: Build task 'CodeCoverage'")
}
 
























function global:copy_files($source, $destination, $exclude = @()) {    
    create_directory $destination
    Get-ChildItem $source -Recurse -Exclude $exclude | Copy-Item -Destination {Join-Path $destination $_.FullName.Substring($source.length)} 
}

function global:Copy_and_flatten ($source, $filter, $dest) {
    ls $source -filter $filter  -r | Where-Object {!$_.FullName.Contains("$testCopyIgnorePath") -and !$_.FullName.Contains("packages") }| cp -dest $dest -force
}

function global:copy_all_assemblies_for_test($destination) {
    create_directory $destination
    Copy_and_flatten $source_dir *.exe $destination
    Copy_and_flatten $source_dir *.dll $destination
    Copy_and_flatten $source_dir *.config $destination
    Copy_and_flatten $source_dir *.xml $destination
    Copy_and_flatten $source_dir *.pdb $destination
    Copy_and_flatten $source_dir *.sql $destination
    Copy_and_flatten $source_dir *.xlsx $destination
}

function global:delete_file($file) {
    if ($file) { remove-item $file -force -ErrorAction SilentlyContinue | out-null } 
}

function global:delete_directory($directory_name) {
    rd $directory_name -recurse -force  -ErrorAction SilentlyContinue | out-null
}

function global:delete_files_in_dir($dir) {
    get-childitem $dir -recurse | foreach ($_) {remove-item $_.fullname}
}

function global:create_directory($directory_name) {
    mkdir $directory_name  -ErrorAction SilentlyContinue  | out-null
}


function script:poke-xml($filePath, $xpath, $value) {
    [xml] $fileXml = Get-Content $filePath
    $node = $fileXml.SelectSingleNode($xpath)
    
    Assert ($node -ne $null) "could not find node @ $xpath"
        
    if ($node.NodeType -eq "Element") {
        $node.InnerText = $value
    }
    else {
        $node.Value = $value
    }

    $fileXml.Save($filePath) 
} 