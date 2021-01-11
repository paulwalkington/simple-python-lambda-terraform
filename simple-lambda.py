import requests
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()
logger.info("hello world")

def lambda_handler(event, context):
    logger.info('Doing some stuff')
    r = requests.get("https://httpbin.org/get")
    logger.info('Has finished doing some stuff')
    print(r.text)