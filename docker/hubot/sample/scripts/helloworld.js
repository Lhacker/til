// # Description
//     Hello world
// 
// # Comamnds:
//     scripts|hubot swing - reply swing gif
//     scripts|hubot thanks - reply grateful image
//     scripts|hubot olive oil - reply mokomichi oil pool image
//     scripts|hubot df - reply current disk info
(function(module) {
  const exec = require('child_process').exec;
  
  module.exports = function(robot) {
    robot.respond(/swing/i, function(res) {
      res.reply('http://livedoor.blogimg.jp/girls002/imgs/f/4/f4af4695.gif');
    });
    robot.respond(/thanks/i, function(res) {
      res.reply('http://blog-imgs-92.fc2.com/m/a/n/mangakikou/1461143785189.jpg');
    });
    robot.respond(/olive\s+oil/i, function(res) {
      res.reply('http://livedoor.blogimg.jp/girls002/imgs/0/c/0c12cf7c.jpg');
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
