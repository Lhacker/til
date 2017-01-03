module.exports = function(router) {
  router.get('/hello', function(req, res, next) {
    res.json({message: 'hello'});
  });
  return router;
};
