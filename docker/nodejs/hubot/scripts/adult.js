(function(module) {
  const urls = {
    twogirls1cup: "http://www.xvideos.com/video21003997/2_girls_1_cup_original_video"
  };
  
  module.exports = function(robot) {
    robot.respond(/unko/i, function(res) {
      res.reply(urls.twogirls1cup);
    });
  }
})(module);
