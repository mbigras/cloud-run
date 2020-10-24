import os
import logging

from app import app

logging.basicConfig(level=os.environ.get("LOG_LEVEL", "INFO").upper())

if __name__ == '__main__':
	app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 3000)))
