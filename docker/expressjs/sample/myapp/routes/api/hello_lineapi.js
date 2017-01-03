const LineReplyAPI = require('./line/reply-api.js');

module.exports = function(router) {
  router.get('/hello_lineapi', function(req, res, next) {
    var lineReplyAPI = new LineReplyAPI(req.params);

    // make data
    // temporarily, will send same message
    var data = [
      {
        "type": "text",
        "text": lineReplyAPI.getReceivedText()
      }
    ];

    // reply by reply API
    lineReplyAPI.sendReplyAsync(data);

    next();
  });
  return router;
};
