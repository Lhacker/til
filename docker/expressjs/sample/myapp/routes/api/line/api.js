(function(module) {

  const https = require('https');
  const apiConfig = require('./api-config.json');

  var lineAPI = function() {
    this.apiConfig = apiConfig;
  };

  lineAPI.prototype.sendReply = function(data) {
    var postRequest = https.request(this.apiConfig.reply.postOption, function(res) {
      var sentData = '';
      res.setEncoding('utf8');
      res.on('data', function(chunk) { sentData += chunk; });
      res.on('end', function() { console.log('Post data : ' + sentData); });
    });

    postRequest.on('error', function(error) {
      console.log(error);
    });

    postRequest.write(JSON.stringify(data));
    postRequest.end();
  };

  module.exports = lineAPI;
})(module);
