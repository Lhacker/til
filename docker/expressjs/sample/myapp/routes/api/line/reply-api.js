(function(module) {

  const https = require('https');
  const replyApiConfig = require('./reply-api-config.json');
  replyApiConfig.postOption.headers.Authorization =
    replyApiConfig.postOption.headers.Authorization
      .replace('{CHANNEL_ACCESS_TOKEN}', process.env.LINE_API_CHANNEL_ACCESS_TOKEN);

  const replyAPI = function(requestData) {
    this.events = requestData.events;
    this.message = this.events[0].message;
    this.text = this.message.text;
    this.replyToken = this.events[0].replyToken;
  };

  replyAPI.prototype.getReceivedText = function() {
    return this.text;
  }

  replyAPI.prototype.sendReplyAsync = function(messages) {
    const postRequest = https.request(replyApiConfig.postOption, function(res) {
      var strSentData = '';
      res.setEncoding('utf8');
      res.on('data', function(chunk) { strSentData += chunk; });
      res.on('end', function() { console.log('Post data : ' + strSentData); });
    });

    postRequest.on('error', function(error) {
      console.log(error);
    });

    const sendData = {
      replyToken: this.replyToken,
      messages: messages
    };
    const strSendData = JSON.stringify(sendData);
    postRequest.write(strSendData);
    postRequest.end();
  };

  module.exports = replyAPI;
})(module);
