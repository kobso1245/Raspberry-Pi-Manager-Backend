.PHONY: clean test help rebase
.DEFAULT_GOAL := help

PYTHON := .venv/bin/python
PIP := .venv/bin/pip
PROJECT := raspbery-pi-manager-backend
DB_FILE := ./tmp/backend.sqlite3
REQUIREMENTS_FILE := requirements.txt
LIBRARIES = $(sort $(dir $(wildcard libs/*/)))

#-----------------------------------------------------------------------------

help:
	@echo "Defined targets:"
	@echo "----------------"
	@echo "help         This text"
	@echo "reqs_gen     Generate backend requirements file"
	@echo "regs_inst    Install backend requirements"
	@echo "migrations   Migrate apps"
	@echo "clean        Clean up python byte-code"
	@echo "run_dev      Run service in development mode"
	@echo "run_prod     Run service in production mode"

all:
	$(filenames)

reqs_gen:
	$(PIP) freeze > $(REQUIREMENTS_FILE)

reqs_inst:
	$(PIP) install -r $(REQUIREMENTS_FILE)

root_dev:
	@echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', '', 'admin')" | ${PYTHON} manage.py shell

migrations:
	${PYTHON} manage.py makemigrations machine

migrate:
	${PYTHON} manage.py migrate

loaddata:
	${PYTHON} manage.py loaddata devel.yaml devel.json

flush_db_dev:
	${PYTHON} manage.py flush --noinput

static:
	${PYTHON} manage.py collectstatic

run_dev: clean migrations migrate root_dev
	${PYTHON} manage.py runserver 0.0.0.0:8000

run_prod: clean migrations migrate root_dev
	${PYTHON} server.py

test:
	${PYTHON} manage.py test

migrate_prod:
	${PYTHON} manage.py migrate

shell:
	${PYTHON} manage.py shell

clean:
	@find . -iregex '.*\.py[cod]' -delete

	@if [ -f $(DB_FILE) ]; then \
		echo "Removing DB File"; \
		rm $(DB_FILE); \
	else \
		echo "No DB file found. Nothing to do."; \
	fi
