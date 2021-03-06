'use strict';

const Hapi = require('hapi');
const Good = require('good');

const server = new Hapi.Server();
server.connection({
  host: 'localhost',
  port: 8000
});

server.route({
  method: 'GET',
  path: '/',
  handler: function(request, reply) {
    return reply('hello world');
  }
});
server.route({
  method: 'GET',
  path: '/{name}',
  handler: function(request, reply) {
    return reply(`hello world, ${request.params.name}`);
  }
});

var pluginInfo = {
  register: Good,
  option: {
    reporters: {
      console: [
        {
          module: 'good-squeeze',
          name: 'Squeeze',
          args: [{
            response: '*',
            log: '*'
          }]
        },
        {
          module: 'good-console'
        },
        'stdout'
      ]
    }
  }
};

server.register(
  pluginInfo,
  (error) => {
    // if failed to load plugin
    if (error) {
      throw error;
    }

    server.start((err) => {
      if (err) {
        throw err;
      }
      server.log('info', `Server running at: ${server.info.url}`);
    });
  }
);
