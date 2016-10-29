const exec = require('child_process').exec;

module.exports = function(robot) {
  robot.respond(/unko/i, function(msg) {
    msg.reply('2girls 1cup');
  });

  robot.respond(/df/i, function(msg) {
    exec('df -h', function(err, stdout, stderr) {
      if (err) {
	msg.reply(err);
      }
      msg.reply(stdout);
    });
  });
}
