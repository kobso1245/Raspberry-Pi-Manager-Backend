FROM alpine:3.7
RUN apk add --no-cache python3 py-virtualenv py3-gunicorn gcc linux-headers python3-dev musl-dev libc-dev libffi-dev libressl-dev make bash

WORKDIR /code
COPY . .

ENTRYPOINT ["make", "run_daphne"]