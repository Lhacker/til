const LineReplyAPI = require('./line/reply-api.js');

module.exports = function(router) {
  router.get('/hello_lineapi', function(req, res, next) {
    res.json({"code": 0, "message": "I'm alive now"});
  });

  router.post('/hello_lineapi', function(req, res, next) {
    try {
      var lineReplyAPI = new LineReplyAPI(req.body);

      // make messages
      // temporarily, will send same message
      var messages = [
        {
          "type": "text",
          "text": lineReplyAPI.getReceivedText()
        }
      ];

      // reply by reply API
      lineReplyAPI.sendReplyAsync(messages);

      res.sendStatus(200);
    } catch(e) {
      console.log('Requested data : ' + JSON.stringify(req.body));
      console.log(e);
      res.sendStatus(500);
    }
  });

  return router;
};
