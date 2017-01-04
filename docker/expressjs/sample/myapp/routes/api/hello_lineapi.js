const LineReplyAPI = require('./line/reply-api.js');

module.exports = function(router) {
  router.get('/hello_lineapi', function(req, res, next) {
    res.json({"code": 0, "message": "I'm alive now"});
  });

  router.post('/hello_lineapi', function(req, res, next) {
    try {
      console.log(require('util').inspect(req.body));
      var lineReplyAPI = new LineReplyAPI(req.body);

      // make messages
      // temporarily, will send same message
      var messages = [
        {
          "type": "text",
          "text": lineReplyAPI.getReceivedText()
        }
      ];

      console.log('before send messages to line reply api');
      // reply by reply API
      lineReplyAPI.sendReplyAsync(messages);
      console.log('after send messages to line reply api');

      res.sendStatus(200);
    } catch(e) {
      console.log(e);
    }
  });
  return router;
};
