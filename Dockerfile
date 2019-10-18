FROM alpine:3.7
RUN apk add --no-cache python3 py-virtualenv py3-gunicorn gcc linux-headers python3-dev musl-dev libc-dev libffi-dev libssl-dev

RUN python3.7 -m virtualenv -p python3.7 /opt/venv
COPY requirements.txt .
RUN . /opt/venv/bin/activate && pip install -r requirements.txt
COPY . .

ENTRYPOINT ["make", "run_dev"]