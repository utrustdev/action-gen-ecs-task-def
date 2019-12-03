FROM python:2.7.17-alpine3.10

COPY entrypoint.sh /entrypoint.sh
COPY gen.py /gen.py

ENTRYPOINT ["/entrypoint.sh"]
