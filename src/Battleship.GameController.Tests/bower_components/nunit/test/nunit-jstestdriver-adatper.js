
(function(global){
	
	if(global && global.NUnit){
		global.NUnit.assert = {
				"equals": function(obj1, obj2, desc){
					return assertEquals(desc, obj1, obj2);
				},
				/** 
				 * Short cut to {@link assert#equals} 
				 * @memberOf assert*/
				"eq": function(obj1, obj2, desc){
					return this.equals(obj1, obj2, desc);
				},
				
				"isTrue": function(obj, desc){
					return assertTrue(desc, obj);
				},
				"isFalse": function(obj, desc){
					return assertFalse(desc, obj);
				},
				"isNull": function(obj, desc){
					return assertNull(desc, obj);
				},
				"notNull": function(obj, desc){
					return assertNotNull(desc, obj);
				},
				"fail":  function(msg){
					msg = isNull(msg)? "": msg ;
					fail(msg);
				}
			};
		
		var EMPTY_FUNC = function(){};
		var Test = global.NUnit.Test = function(desc){
			var o = TestCase(desc);
			return o.prototype;
		};
		
		Test.prototype.before = EMPTY_FUNC ;
		Test.prototype.after = EMPTY_FUNC ;
		Test.beforeClass = EMPTY_FUNC ;
		Test.afterClass = EMPTY_FUNC ;
		Test.BEFORE  = "before" ;
		Test.AFTER = "after" ;
		Test.BEFORE_CLASS = "beforeClass" ;
		Test.AFTER_CLASS = "afterClass";
		
		//mock module.exports
		global.module = {exports: {}};
	}
})(this);