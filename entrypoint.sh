#!/usr/bin/env bash
# Start uWSGI server.

PORT=${PORT:-3000}

exec uwsgi --protocol=http --wsgi=wsgi:app --socket=0.0.0.0:$PORT $@
