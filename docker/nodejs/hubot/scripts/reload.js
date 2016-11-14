(function(module) {
  const fs = require('fs');
  const path = require('path');

  var oldCommands = null;
  var oldListeners = null;

  module.exports = function(robot) {
    robot.hear(/command count/i, function(res) {
      res.send(`I am aware of ${res.robot.commands.length} + commands`);
    });
    robot.hear(/commands data/i, function(res) {
      res.send(JSON.parse(res.robot.commands));
    });

    robot.respond(/reload scripts/i, function(res) {
      try {
        oldCommands = robot.commands;
        oldListeners = robot.listeners;
        robot.commands = [];
        robot.listeners = [];

        reloadAllScripts(res, success, function(err) {
          res.send(err);
        });
      } catch (error) {
        console.log(`Hubot reloader ${error}`);
        res.send(`Could not reload all scripts: ${error}`);
      }
    });
  };

  reloadAllScripts = function(res, success, error) {
    var robot = res.robot;
    robot.emit('reload_scripts');

    var scriptsPath = Path.resolve(".", "scripts");
    robot.load(scriptsPath);

    var srcScriptsPath = Path.resolve(".", "src", "scripts");
    robot.load(scriptsPath);

    var hubotScripts = Path.resolve(".", "hubot-scripts.json");
    robot.load(scriptsPath);
    fs.exists(hubotScripts, function(exists) {
        if (exists) {
          fs.readFile(hubotScripts, function(err, data) {
            if (data.length > 0) {
              try {
                var scripts = JSON.parse(data);
                var nodeModulesScriptsPath = Path.resolve("node_modules", "hubot-scripts", "src", "scripts");
                robot.loadHubotScripts(nodeModulesScriptsPath);
              } catch (err) {
                error(`Error parsing JSON data from hubot-scripts.json: ${err}`);
                return;
              }
            }
          });
        }
    });

    var externalScripts = Path.resolve(".", "external-scripts.json");
    fs.exists(externalScripts, function(exists) {
      if (exists) {
        fs.readFile(externalScripts, function(err, data) {
          if (data.length > 0) {
            var scripts = null;
            try {
              scripts = JSON.parse(data);
            } catch (err) {
              error(`Error parsing JSON data from hubot-scripts.json: ${err}`);
              return;
            }
            robot.loadExternalScripts(scripts);
            return;
          }
        });
      }
    });
    afterReloaded(res);
  };

  var afterReloaded = function(res) {
    // cleanup old listeners and help
    for (var listener in oldListeners) {
      listener = {};
    }
    oldListeners = null;
    oldCommands = null;
  };

})(module);
