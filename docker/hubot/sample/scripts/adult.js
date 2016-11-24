// # Description
//     Respond adult words
// 
// # Comamnds:
//     scripts|hubot unko - reply 2 girls 1 cup url link
(function(module) {
  const urls = {
    twogirls1cup: "http://www.xvideos.com/video21003997/2_girls_1_cup_original_video"
  };
  
  module.exports = function(robot) {
    robot.hear(/^\s*unko\s*$/i, function(res) {
      res.send(urls.twogirls1cup);
    });
  }
})(module);
