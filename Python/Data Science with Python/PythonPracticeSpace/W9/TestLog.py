import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
logger.log(logging.DEBUG,'Debug訊息')
logger.log(logging.INFO,'Info訊息')
logger.log(logging.WARNING,'Warning訊息')
logger.log(logging.ERROR,'Error訊息')
logger.log(logging.CRITICAL,'Critical訊息')
