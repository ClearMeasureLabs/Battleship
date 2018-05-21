powershell.exe -NoProfile -ExecutionPolicy unrestricted -Command "& { Install-Module VSSetup -Scope CurrentUser -Force; if ($lastexitcode -ne 0) {write-host "ERROR: $lastexitcode" -fore RED; exit $lastexitcode}  }"
powershell.exe -NoProfile -ExecutionPolicy unrestricted -Command "& { Import-Module '.\src\packages\psake.4.7.0\tools\psake\psake.psm1'; Invoke-psake '.\default.ps1' %1; if ($lastexitcode -ne 0) {write-host "ERROR: $lastexitcode" -fore RED; exit $lastexitcode} }" 

