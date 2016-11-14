// Ref: https://github.com/github/hubot-scripts/blob/master/src/scripts/reload.coffee
(function(module) {
  const fs = require('fs');
  const path = require('path');

  var oldCommands = null;
  var oldListeners = null;

  module.exports = function(robot) {
    robot.hear(/command count/i, function(res) {
      res.send(`I am aware of ${res.robot.commands.length} + commands`);
    });

    robot.respond(/reload scripts/i, function(res) {
      try {
        oldCommands = res.robot.commands;
        oldListeners = res.robot.listeners;
        res.robot.commands = [];
        res.robot.listeners = [];

        reloadAllScripts(res, successReloading, errorReloading);
      } catch (error) {
        console.log(`Hubot reloader ${error}`);
        res.send(`Could not reload all scripts: ${error}`);
      }
    });
  };

  var successReloading = function(res) {
    // cleanup old listeners and help
    for (var listener in oldListeners) {
      listener = {};
    }
    oldListeners = null;
    oldCommands = null;
    res.send("Reloaded all scripts!");
  };

  var errorReloading = function(res, errorMessage) {
    res.send(errorMessage);
  };

  var reloadAllScripts = function(res, successReloading, errorReloading) {
    var robot = res.robot;
    robot.emit('reload_scripts');

    // reload scripts
    robot.load(path.resolve(".", "scripts"));
    robot.load(path.resolve(".", "src", "scripts"));
    if (!reloadHubotScripts(res, errorReloading)) {
      return;
    }
    if (!reloadExternalScripts(res, errorReloading)) {
      return;
    }

    successReloading(res);
  };

  var reloadHubotScripts = function(res, errorReloading) {
    var robot = res.robot;
    var hubotScripts = path.resolve(".", "hubot-scripts.json");
    fs.access(hubotScripts, function(accessError) {
      if (accessError) {
        errorReloading(`Cannot access ${hubotScripts}`);
        return false;
      } else {
        fs.readFile(hubotScripts, function(readError, data) {
          if (data.length > 0) {
            try {
              var scripts = JSON.parse(data);
              var nodeModulesScriptsPath = path.resolve("node_modules", "hubot-scripts", "src", "scripts");
              res.robot.loadHubotScripts(nodeModulesScriptsPath, scripts);
            } catch (err) {
              errorReloading(res, `Error parsing JSON data from hubot-scripts.json: ${err}`);
              return false;
            }
          }
        });
      }
    });
    return true;
  };

  var reloadExternalScripts = function(res, errorReloading) {
    var robot = res.robot;
    var externalScripts = path.resolve(".", "external-scripts.json");
    fs.access(externalScripts, function(accessError) {
      if (accessError) {
        errorReloading(`Cannot access ${externalScripts}`);
        return false;
      } else {
        fs.readFile(externalScripts, function(readError, data) {
          if (data.length > 0) {
            var scripts = null;
            try {
              scripts = JSON.parse(data);
            } catch (err) {
              errorReloading(`Error parsing JSON data from external-scripts.json: ${err}`);
              return false;
            }
            robot.loadExternalScripts(scripts);
          }
        });
      }
    });
    return true;
  };

})(module);
