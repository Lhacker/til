(function(module) {

  var util = require('util');

  util.prototype.clone = function(o) {
    return JSON.parse(JSON.stringify(o));
  };

  module.exports = util;
})(module);
