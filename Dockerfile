FROM python:3.7.9
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY version.py app.py wsgi.py entrypoint.sh slack.sh ./
ENTRYPOINT ["/app/entrypoint.sh"]
