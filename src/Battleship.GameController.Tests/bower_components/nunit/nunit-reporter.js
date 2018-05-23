/**
	Interface - NunitReporter
*/
(function(window){
	var factory = function(nunit){

		var Reporter= nunit.Reporter = function(){
		}

		Reporter.prototype = {
			/** @param {Number} testCount */
			/** @param {String} desc */
			testUnitBegin: function(testCount, desc){

			},
			/** @param {String} testName  */
			testBegin: function(id, testName){

			},
			/** @param {NUnit.Test} test  */
			/** @param {String} testName  */
			/** @param {NUnit.TestResult} result  */
			testEnd: function(id, testName, result){

			},

			testUnitEnd: function(testCount, desc, failedCount){

			},

			println: function(level, message){

			}

		};

		return Reporter;
	};

	if(window && window.NUnit){
		factory(window.NUnit);
	}

	typeof module !== "undefined"? module.exports = factory: "" ;
})(this);
