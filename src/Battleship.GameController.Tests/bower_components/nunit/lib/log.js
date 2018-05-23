


var log = {
		_callConsole: function(funcName, params){
			if(isNull(console)){
				//No console support
				//TODO alert ? reroute ?
				
			}else{
				invoke(console, funcName, params) ;
			}
			
			if(this.writeToBody && document){
				document.write("[" + funcName.toUpperCase() + "] " + params + "<br>");
			}
		},
		log:  function(any){
			this._callConsole("log", any);
		},
		info: function(any){
			this._callConsole("info", any);
		},
		warn: function(any){
			this._callConsole("warn", any);
		},
		error: function(any){
			this._callConsole("error", any);
		},
		err: function(any){
			this.error(any);
		}, // short cut
		enabled: true,
		writeToBody: false
};
