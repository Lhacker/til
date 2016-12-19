import logging
import logging.config

# ref: http://lab.hde.co.jp/2008/02/pythonlogging.html

logging.config.fileConfig('./log.conf')
logger = logging.getLogger('app')

logger.debug('logger=app debug message')
logger.info('logger=app info message')
