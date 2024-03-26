# Variables
DOCKER_COMPOSE=docker compose

# Targets
.PHONY: start rebuild prune

start:
	$(DOCKER_COMPOSE) up

rebuild:
	$(DOCKER_COMPOSE) up --build

prune:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans