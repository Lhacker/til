import logging

logging.basicConfig(filename='example.log', filemode='w', level = logging.DEBUG)

logging.debug('Debugging information')
logging.info('informational message')
logging.warning('Warning:config file %s not found', 'server.conf')
logging.error('Error occurred')
logging.critical('Critical error - shutting down')
