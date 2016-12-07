// # Description
//     Hello world
// 
// # Comamnds:
//     scripts|hubot swing - reply swing gif
//     scripts|hubot thanks - reply grateful image
//     scripts|hubot olive oil - reply mokomichi oil pool image
//     scripts|hubot df - reply current disk info
(function(module) {
  // https://github.com/lmarkus/hubot-conversation
  const Conversation = require('hubot-conversation');
  const exec = require('child_process').exec;

  module.exports = function(robot) {
    var conversation = new Conversation(robot);
    robot.respond(/swing/i, function(res) {
      res.reply('http://livedoor.blogimg.jp/girls002/imgs/f/4/f4af4695.gif');
    });
    robot.respond(/thanks/i, function(res) {
      res.reply('http://blog-imgs-92.fc2.com/m/a/n/mangakikou/1461143785189.jpg');
    });
    robot.respond(/olive\s+oil/i, function(res) {
      res.reply('http://livedoor.blogimg.jp/girls002/imgs/0/c/0c12cf7c.jpg');
    });
    robot.respond(/conversation/i, function(res) {
        res.reply('Are you sure?');
        var dialog = conversation.startDialog(res);
        dialog.addChoice(/yes/i, function(res2) { res2.reply('fuck you!'); });
        dialog.addChoice(/no/i, function(res2) { res2.reply('kill you!'); });
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
