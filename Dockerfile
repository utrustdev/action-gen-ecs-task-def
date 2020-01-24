FROM python:2.7.17-alpine3.10

COPY entrypoint.sh /entrypoint.sh
COPY task-definition.json.tpl /task-definition.json.tpl
COPY dictionary.json dictionary.json
COPY gen.py /gen.py

ENTRYPOINT ["/entrypoint.sh"]
