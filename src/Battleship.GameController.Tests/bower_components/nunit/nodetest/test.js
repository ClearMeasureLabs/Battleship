(function(window){
	var nunit = require("../nunit.js") ;
	var assert = nunit.assert ;
	var test = nunit.Test("NUnit Test without require ...");


	test.testConstructor = function(){
		var t = new nunit.Test();
		assert.isTrue(t instanceof nunit.Test);
		t = nunit.Test();
		assert.isTrue(t instanceof nunit.Test);
	};

	test.testName = function(){
		var t = new nunit.Test('mytest');
		assert.eq("mytest", t.desc);
	};

	/** @memberOf test */
	test.testEq = function(){
		assert.eq("", "");
		
		//When not equal, there will be an exception and err should not be null
		var err;
		try{
			assert.eq("", 123, "When not equal, there will be an exception and err should not be null");
		}catch(e){err = e;}
		assertNotNull(err);
		//assertEquals("When not equal, there will be an exception and err should not be null", err.message);

	};

	test.assertTrue = function(){
		assert.isTrue(true);
		assert.isFalse(false);
		var err;
		try{
			assert.isTrue({}, "desc");
		}catch(e){err = e;}
		assertNotNull(err);
		eq("desc", err.message);
		
		var err;
		try{
			assert.isTrue({});
		}catch(e){err = e;}
		assertNotNull(err);
		eq("Expecting true", err.message);
		
		
		var err;
		try{
			assert.isFalse("");
		}catch(e){err = e;}
		assertNotNull(err);
		eq("Expecting false", err.message);
		
		var err;
		try{
			assert.isFalse(1, "desc");
		}catch(e){err = e;}
		assertNotNull(err);
		eq("desc", err.message);
		
	}

	test.isNull = function(){
		assert.isNull(null);
		assert.isNull(undefined);
		
		assert.notNull("");
		assert.notNull(1);
		assert.notNull(0);
		
		
		var err;
		try{
			assert.isNull("null", "should be null");
		}catch(e){err = e;}
		assertNotNull(err);
		eq("should be null", err.message);
		
		var err;
		try{
			assert.isNull(1);
		}catch(e){err = e;}
		assertNotNull(err);
		eq("Expecting null", err.message);
		
	};

	test.testFail = function(){
		var err;
		try{
			fail();
		}catch(e){err = e;}
		assertNotNull(err);
		eq("", err.message);
		
		var err;
		try{
			fail("msg");
		}catch(e){err = e;}
		assertNotNull(err);
		eq("msg", err.message);
		
	};

	test.testTestClass = function(){
		var a = assert;
		var t = new nunit.Test();
		a.isTrue(t instanceof nunit.Test);
		t.testOne = function(){};
	//	a.equals(1, Object.getOwnPropertyNames(t).length);

	};

	test.testRunner = function(){
		var a = assert;
		
		var runner = new nunit.TestRunner();

		var err;
		try{
			runner.run();
		}catch(e){
			err = e;
		}
		a.notNull(err, "No test to run will cause error");

		var t = new nunit.Test();
		t.myTest = function(){ a.fail();};
		runner.run(t);

	};

	test.testeReporter = function(){
		var a = nunit.assert ;
		var g = a.guarantee();
		var count  = 0 ;
		var t = new nunit.Test();
		t.test1 = function(){};
		t.test2 = function(){ a.fail()};
		var reporter =  {
			/** @param {Number} testCount */
			/** @param {String} desc */
			testUnitBegin: function(testCount, desc){
				g.cross("testUnitBegin");
				a.equals(2, testCount);
				a.equals(t.desc, desc);
			},
			/** @param {String} testName  */
			testBegin: function(id, testName){
				g.cross("testBegin");
				a.isTrue(id === t.desc + ".test1" || id === t.desc + ".test2");
				a.isTrue(testName === "test1" || testName === "test2");
			},
			/** @param {NUnit.Test} test  */
			/** @param {String} testName  */
			/** @param {Boolean} result  */
			testEnd: function(id, testName, result){
				g.cross("testEnd");
				a.isTrue(id === t.desc + ".test1" || id === t.desc + ".test2");
				a.isTrue(testName === "test1" || testName === "test2");
				a.isTrue (result == true || result === false);
			},

			testUnitEnd: function(testCount, desc, failedCount){
				g.cross("testUnitEnd");
				a.equals(2, testCount);
				a.equals(t.desc, desc);
				a.eq(1, failedCount);
			}

		};

		var runner = new nunit.TestRunner();
		runner.addReporter(reporter);
		runner.run(t);
		g.count(4, "4 method should all be executed once");
	};


	test.testGuarantee = function(){
		var g = assert.guarantee();
		g.cross();
		g.cross();
		g.count(2);

		g.cross("Point 1");
		try{
			g.count(2);
		}catch(e){
			console.log(e.message);
			assert.contains(e.message, "Point 1");
		}
	};

	test.testContains = function(){
		assert.contains("abc", "c");

	}

	test.testConfig = function(){
		var a = assert ;
		var opt = nunit.config({});
		a.notNull(opt.debug);
		a.notNull(opt.tests);
		a.notNull(opt.reporters);
		a.eq("ConsoleReporter", opt.reporters[0].id);

		var opt = nunit.config({reporters:[{id: "any"}],
			tests:[new Object], debug: true});
		a.notNull(opt.debug);
		a.t(opt.debug)
		a.notNull(opt.tests);
		a.notNull(opt.reporters);
		a.eq(1, opt.tests.length);
		a.eq(1, opt.reporters.length);
		a.eq("any", opt.reporters[0].id);

	}

})(this);
