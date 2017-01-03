module.exports = function(router) {
  router.get('/hello_lineapi', function(req, res, next) {
    res.json({message: 'hello line'});
  });
  return router;
};
