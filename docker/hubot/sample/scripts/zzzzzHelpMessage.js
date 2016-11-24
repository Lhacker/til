// # Description
//     Test help commands
// 
// # Comamnds:
//     scripts|hubot chelp - show custom commands help
(function(module) {
  const customCommandsPrefix = 'scripts|';

  module.exports = function(robot) {
    var customCommands = [];
    var helpCommands = robot.helpCommands();
    for (var i = 0, l = helpCommands.length; i < l; i++) {
      var command = helpCommands[i];
      if (command.indexOf(customCommandsPrefix) == 0) {
        customCommands.push(command.replace(customCommandsPrefix, ''));
      }
    }
    var customCommandsLength = customCommands.length;

    robot.respond(/chelp\s*(.*)/i, function(res) {
      var commands = [];
      var keyword = res.match[1];
      if (res.match.length > 0 && keyword.length > 0) {
        for (var i = 0; i < customCommands.length; i++) {
          var command = customCommands[i];
          if (command.indexOf(keyword) > -1) {
            commands.push(command);
          }
        }
      } else {
        commands = [].concat(customCommands);
      }
      res.reply(commands.join('\n'));
    });
  }
})(module);
