import logging
import logging.config

logging.config.fileConfig('./log.conf')
logger = logging.getLogger('app')

logger.debug('logger=app debug message')
logger.info('logger=app info message')
