(function(module) {
  const exec = require('child_process').exec;
  
  module.exports = function(robot) {
    robot.respond(/swing/i, function(res) {
      res.reply('http://livedoor.blogimg.jp/girls002/imgs/f/4/f4af4695.gif');
    });
    robot.respond(/olive\s+oil/i, function(res) {
      res.reply('http://livedoor.blogimg.jp/girls002/imgs/0/c/0c12cf7c.jpg');
    });
    robot.hear(/I like pie/i, function(res) {
      res.send("makes a freshly baked pie");
    });
  
    robot.respond(/df/i, function(res) {
      exec('df -h', function(err, stdout, stderr) {
        if (err) {
  	res.reply(err);
        }
        res.reply(stdout);
      });
    });
  }
})(module);
