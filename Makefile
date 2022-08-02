CURRENT_DIRECTORY := $(shell pwd)

help:
	@echo "Docker Compose Help"
	@echo "-----------------------"
	@echo ""
	@echo "Run tests to ensure current state is good:"
	@echo "    make test"
	@echo ""
	@echo "If tests pass, add fixture data and start up the api:"
	@echo "    make begin"
	@echo ""
	@echo "Really, really start over:"
	@echo "    make clean"
	@echo ""
	@echo "See contents of Makefile for more targets."

begin: migrate fixtures start

start:
	@docker-compose up

stop:
	@docker-compose stop

down:
	@docker-compose down

status:
	@docker-compose ps

restart: stop start

clean: stop
	@docker-compose rm --force
	@find . -name \*.pyc -delete

build:
	@docker-compose build

test:
	@docker-compose run --rm app sh -c "python manage.py test"

db-check:
	@docker-compose run --rm app sh -c "python manage.py wait_for_db"

check-lint:
	@docker-compose run --rm app sh -c "flake8"

migrations:
	@docker-compose run --rm app sh -c "python manage.py makemigrations"

apply-migrations:
	@docker-compose run --rm app sh -c "python manage.py wait_for_db && python manage.py migrate"

testwarn:
	@docker-compose run --rm app python -Wall manage.py test ${TESTSCOPE} ${TESTFLAGS}

migrate:
	@docker-compose run --rm app python ./manage.py migrate

fixtures:
	@docker-compose run --rm app python ./manage.py runscript load_all_fixtures

cli:
	@docker-compose run --rm app bash

tail:
	@docker-compose logs -f

.PHONY: start stop status restart clean build test testwarn migrate fixtures cli tail