
(function(window){

	var KarmaReporter = function(karma){
		this.karma = karma ;
		this.startTime = -1 ;
		this.endTime = -1 ;
	};
	KarmaReporter.prototype = {
		testUnitBegin: function(testCount, desc){
			this.karma.info({total: testCount});
		},
		testBegin: function(id, testName){
			this.startTime = Date.now();
		},
		testEnd: function(id, testName, res){
			this.endTime = Date.now();
			var result = {
		      id: id,
		      description: "",
		      suite: [],
		      success: res.passed,
		      skipped: false,
		      time: this.endTime - this.startTime,
		      log: []
		    };

		    this.karma.result(result);
		},
		testUnitEnd: function(testCount, desc, failedCount)){
			this.karma.complete({
		      coverage: window.__coverage__
		    });
		}

	};


	var loadNUnit = function(NUnit){
		return NUnit ? NUnit: (
				window.NUnit ? window.UNit : (
						typeof require !== "undefined"? require("nunit"): undefined
					)
			);
	};
	var createStartFn = function(karma, _NUnit){
		return function(config){
		    var NUnit = loadNUnit(_NUnit);
		    var reporter = new KarmaReporter(karma);
		    
		};
	};
	window.__karma__.start = createStartFn(window.__karma__);
})(window);