# Dockerfile.vulnerable
# ─────────────────────────────────────────────────────────────────────────────
# INTENTIONALLY INSECURE — for Week 4 observation and Week 5 scanning exercise.
# Do NOT use this Dockerfile for staging or production.
#
# HOW TO USE:
#   Before deploying, copy the vulnerable app files into app/ first:
#     cp vulnerable_app/app.py app/app.py
#     cp vulnerable_app/requirements.txt app/requirements.txt
#     cp -r vulnerable_app/templates/. app/templates/
#   Then swap this file over the main Dockerfile:
#     cp Dockerfile.vulnerable Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

RUN useradd -m appuser
USER appuser
FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

RUN useradd -m appuser
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]



EXPOSE 5000

CMD ["python", "app.py"]


