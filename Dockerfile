FROM python:3.11.2-alpine3.17

COPY entrypoint.sh /entrypoint.sh
COPY gen.py /gen.py

ENTRYPOINT ["/entrypoint.sh"]
