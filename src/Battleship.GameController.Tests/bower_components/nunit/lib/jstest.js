/**
 * @requires util.js 
 */

	var jstest = {};

	/**
	 * */
//	var requires = function(desc, obj){
//		var args = arrangeTwoArgs(desc, obj);
//		if(isNull(args[1])){
//			throw new Error("Requires " + desc);
//		} 
//		return true ;
//	};

	/**
	 * Assert equals. Do not use to compare two null value. Use {@link #isNull} to assert a null(or undefined) value.
	 */
	var assertEquals = function(desc, obj1, obj2){
		var args = arrangeArgs(desc, obj1, obj2);
		if(args[1] === args[2] || toStr(args[1]) == toStr(args[2])){
			return true ;
		};
		throw new Error("Expecting " + toStr( args[1]) + " but was " + toStr(args[2])) ;
	};
	/* Short cut */
	var eq = assertEquals ;
//	var assertNotSame = function(obj1, obj2){
//		if(args[0] !== args[1] || toStr(args[0]) !== toStr(args[1])){
//			return true ;
//		};
//		throw new Error("Expecting " + toStr( args[1]) + " but was " + toStr(args[2])) ;
//	};

	var assertTrue = function(obj){
		if(obj === true){
			return true ;
		}
		throw new Error("Expecting true");
	};

	var assertFalse = function(obj){
		if(obj === false){
			return true ;
		}
		throw new Error("Expecting false");
	};

	var assertNull = function(obj){
		if(isNull(obj)){
			return true ;
		}
		throw new Error("Expecting null");
	};

	var assertNotNull = function(obj){
		if(!isNull(obj)){
			return true ;
		}
		throw new Error("Expecting not null");
	};

	var fail = function(msg){
		msg = isNull(msg)? "": msg ;
		throw new Error(msg);
	};

	/**
	 * @returns An array of objects [obj1, obj2]
	 */
	var arrangeArgs = function(desc, obj1, obj2){
		if(!isNull(obj2)){
			return [desc, obj1, obj2];
		}else if(!isNull(obj1)){
			return ["", desc, obj1] ;
		}
		throw new Error("At lease two arguments were expected.");
	};

	var arrangeTwoArgs = function(desc, obj){
		if(!isNull(obj)){
			return [desc, obj];
		}else if(!isNull(desc)){
			return ["", desc] ;
		}
		throw new Error("At lease one arguments were expected.");
	};



	var toStr = function(obj){
		if (isNull(obj)){
			return "" + obj;
		}
		
		return JSON.stringify(obj);
	};

	/** 
	 * Returns true if obj is null of undefined 
	 * */
	var isNull = function(obj){
		/* null === undefined is false 
		 * null == undefined is true */
		return obj == undefined ;
	};

	var EMPTY_FUNC = function(){};
	var Test = function(){
//		this.before ;
//		this.after;
	};

	Test.prototype.before = EMPTY_FUNC ;
	Test.prototype.after = EMPTY_FUNC ;
	Test.beforeClass = EMPTY_FUNC ;
	Test.afterClass = EMPTY_FUNC ;
	Test.BEFORE  = "before" ;
	Test.AFTER = "after" ;
	Test.BEFORE_CLASS = "beforeClass" ;
	Test.AFTER_CLASS = "afterClass";

	var TestRunner ;
	(function(){
		
		TestRunner = {
				run: function(test){
					var total = 0, failed = 0 , successful = 0;
					this.info('[TestRunner] ' + 'Starting test.');
//					this.out.println('log', '[TestRunner] ' + 'Starting test.');
					if(Test.prototype.isPrototypeOf(test) == false){
						this.info('[TestRunner] ' + 'No test found.');
						return ;
					}
					
					//Run Test.beforeClass
					if(test.hasOwnProperty(Test.BEFORE_CLASS) ){
						this.log('[TestRunner] ' + 'Running BEFORE_CLASS function.');
						invoke(test, Test.BEFORE_CLASS);
					}
					for(var prop in test){
						if(test.hasOwnProperty(prop)){
							if("before" == prop){
								continue ;
							}
							if(test.hasOwnProperty(Test.BEFORE) && typeof test[Test.BEFORE] === "function"){
								this.log('[TestRunner] ' + 'Running BEFORE.');
								invoke(test,Test.BEFORE);
							}
							this.log('[TestRunner] ' + 'Running #' + prop);
							try{
								if(typeof test[prop] === "function"){
									total ++ ;
									invoke(test,prop) ;
									successful ++ ;
								}
							}catch(e){
								failed ++ ;
								this.err("[#" + prop +"] " + e.message);
								this.err("Failed: #"+ prop );
//								log.err(e);
							}
							
							if(test.hasOwnProperty(Test.AFTER) && typeof test[Test.AFTER] === "function"){
								this.log('[TestRunner] ' + 'Running AFTER');
								invoke(test,Test.AFTER);
							}
						}
					}
					if(test.hasOwnProperty(Test.AFTER_CLASS) ){
						this.log('[TestRunner] ' + 'Running AFTER_CLASS');
						invoke(test, Test.AFTER_CLASS);
					}
					
					this.log('[TestRunner] ' + 'Finishing test.');
					this.info('[TestRunner] ' + 'Ran ' + total + ' tests, ' + successful + ' were successful, ' + failed + ' were failed.');
				},
				info: function(msg){
					this._log("INFO", msg)
				},
				error: function(msg){
					this._log("ERROR", msg);
				},
				err: function(msg){
					this.error(msg);
				},
				log: function(msg){
					this._log("LOG", msg);
				},
				_log: function(level, msg, skipAppenders){
					if(console){
						switch(level){
							case "LOG":
								console.log(msg);
								break;
							case "INFO":
								console.info(msg);
								break;
							case "ERROR":
								//console.error(msg);
								console.error(msg);
//								console.trace();
								break ;
						}
					}
					if(this.appenders && !skipAppenders){
						for(var index in this.appenders){
							try{
								this.appenders[index]['append'](level, msg);
							}catch(e){
								this._log("ERROR", e.message, true);
							}
							
						}
						
					}
				},
				appenders:[]
		};
//		if(typeof log !== 'undefined'){
//			TestRunner.out = log ;
//		}else if(typeof console !== 'undefined'){
//			TestRunner.out = console ;
//		}
	})();

