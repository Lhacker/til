import logging

logging.basicConfig(format = '%(asctime)s [%(levelname)s] %(message)s',
        level = logging.DEBUG, datefmt = '%Y/%m/%d %H:%M:%S')

logging.debug('Debugging information')
logging.info('informational message')
logging.warning('config file %s not found', 'server.conf')
