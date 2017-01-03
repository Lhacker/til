(function(module) {

  const https = require('https');
  const replyApiConfig = require('./reply-api-config.json');

  var replyAPI = function(requestData) {
    this.events = requestData.events;
    this.message = this.events[0].message;
    this.text = this.message.text;
    this.replyToken = this.events[0].replyToken;
  };

  replyAPI.prototype.getReceivedText = function() {
    return this.text;
  }

  replyAPI.prototype.sendReplyAsync = function(data) {
    var postRequest = https.request(replyApiConfig.postOption, function(res) {
      var sentData = '';
      res.setEncoding('utf8');
      res.on('data', function(chunk) { sentData += chunk; });
      res.on('error', function(error) { console.log(error); });
      res.on('end', function() { console.log('Post data : ' + sentData); });
    });

    postRequest.on('error', function(error) {
      console.log(error);
    });

    var sendData = JSON.stringify(data)
      .replace('{CHANNEL_ACCESS_TOKEN}', process.env.LINE_API_CHANNEL_ACCESS_TOKEN);
    postRequest.write(sendData);
    postRequest.end();
  };

  module.exports = replyAPI;
})(module);
