from flask import Flask
import os
import requests
import json
import logging

from version import VERSION

logger = logging.getLogger(__name__)

app = Flask(__name__)

try:
	config = {
		"SLACK_URL": os.environ["SLACK_URL"],
		"APP_URL": os.environ["APP_URL"],
	}
except KeyError as e:
	logger.error(f"Failed to set required env var {e}")
	raise SystemExit(1)

@app.route("/")
def up():
	return "up\n"

@app.route("/version")
def version():
	return f"{VERSION}\n"

@app.route("/slack")
def _slack():
	logger.info("Got request to post App version to egfast #general slack channel")
	data = {
		"channel": "#general",
		"text": f"<{config['APP_URL']}/version|App> is running version {VERSION}",
	}
	res = requests.post(config["SLACK_URL"], data=json.dumps(data), headers={'Content-Type': 'application/json'})
	if res.ok:
		logger.info("Successfully posted App version to slack")
	else:
		logger.error(f"Failed to post App version to slack reason is {res.reason}")
	return res.text


if __name__ == '__main__':
	logging.basicConfig(level=os.environ.get("LOG_LEVEL", "INFO").upper())
	app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 3000)))
