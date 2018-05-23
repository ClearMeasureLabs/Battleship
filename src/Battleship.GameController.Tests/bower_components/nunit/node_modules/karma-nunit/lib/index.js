var path = require('path');

var createPattern = function(path) {
  return {pattern: path, included: true, served: true, watched: false};
};

var initNUnit = function(files) {
	var p = path.dirname(require.resolve('nunit'));
	files.unshift(createPattern(__dirname + '/adapter.js'));
  	files.unshift(createPattern(p + '/nunit.js'));
};

initNUnit.$inject = ['config.files'];

module.exports = {
  'framework:nunit': ['factory', initNUnit]
};