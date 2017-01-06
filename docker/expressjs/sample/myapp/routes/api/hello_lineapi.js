(function(module) {

  const WebhookRequest = require('./line/webhook-request.js');
  const LineReply = require('./line/reply-api.js');
  const CHANNEL_SECRET_KEY = process.env.HELLO_LINEAPI_LINE_CHANNEL_SECRET_KEY;
  const CHANNEL_ACCESS_TOKEN = process.env.HELLO_LINEAPI_LINE_CHANNEL_ACCESS_TOKEN;

  const routeUrl = function(router) {
    router.get('/hello_lineapi', function(req, res, next) {
      res.json({"code": 0, "message": "I'm alive now"});
    });

    router.post('/hello_lineapi', function(req, res, next) {
      // As Webhook API spec, we have to return 200 OK response
      res.sendStatus(200);

      try {
        if (!WebhookRequest.isValid(req, CHANNEL_SECRET_KEY)) {
          console.log('Bad request :' +
                      'Requested header : ' + JSON.stringify(req.headers) + "\n" +
                      'Requested data : ' + JSON.stringify(req.body));
          return next();
        }

        for (let i = 0, l = req.body.events.length; i < l; i++) {
          let webhookRequest = new WebhookRequest(req.body.events[i]);

          if (webhookRequest.type.match(`${WebhookRequest.CONSTANT.EVENT_TYPE.MESSAGE}`)) {
            // make messages
            // temporarily, will send same message
            var messages = [
              {
                "type": "text",
                "text": webhookRequest.message.text
              },
              {
                "type": "text",
                "text": 'やらないか'
              }
            ];

            // reply by reply API
            let lineReply = new LineReply(CHANNEL_ACCESS_TOKEN);
            lineReply.sendReplyAsync(webhookRequest.replyToken, messages);
          }
        }

      } catch(e) {
        console.log('Internal Server Error :' +
                    'Requested header : ' + JSON.stringify(req.headers) + "\n" +
                    'Requested data : ' + JSON.stringify(req.body) + "\n" +
                    e);
      }
    });

    return router;
  };

  module.exports = routeUrl;

})(module);
