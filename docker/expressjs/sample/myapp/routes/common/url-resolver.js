var path = require('path');

module.exports = function(dirName, fileName) {
  var pathWithoutExtension = path.join(dirName, path.basename(fileName, '.js'));
  var delimitedPath = pathWithoutExtension.split(path.sep);
  return '/' + delimitedPath.slice(delimitedPath.indexOf('routes') + 1).join('/');
};
