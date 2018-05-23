
var invoke = function(thisArg, funcName, params){
	var alen = arguments.length ;
	if(alen < 2 || !thisArg){
		throw Error("Must have thisArg and funcName");
	}
	var cParams = [];
	var func = thisArg[funcName] ;
	switch(alen){
		case 2:
			break;
		case 3:
			Array.isArray(params) ? cParams = params: cParams = [params] ;
			break;
		default:
			// > 3
			for(var i = 2 ; i < alen ; i ++){
				cParams.push(arguments[i]);
			}
	}
//	cParams.unshift(thisArg);
	if(func && typeof func == "function"){
//		return func.call.apply(func, cParams) ;
		return func.apply(thisArg, cParams) ;
	}else{
		throw Error( funcName + " is not found on object.");
	}
};

var isNull = function(obj){
	return obj == undefined ;
};

var hasProperty = function(obj, prop){
	return Object.prototype.hasOwnProperty.call(obj, prop);
};

// Object.create
(function(){
	if(typeof Object.create !== 'function'){
		Object.create = function(o){
			var f = new function(){};
			f.prototype = o;
			return new f();
		};
	}
})();

typeof module !== 'undefined'? 
		module.exports = {
		invoke:invoke
		, isNull: isNull
		, hasOwnProperty: hasProperty
		}: "";