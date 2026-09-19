# Every version below is DERIVED, so none is written out twice.
#   Node: .nvmrc is the single source of truth (PNPM_SECURITY.md -> "Node
#     version - single source of truth"). Bump it, run `make sync`, commit both.
#   pnpm: package.json's packageManager field is the source of truth
#     (PNPM_SECURITY.md -> "Keep pnpm updated via the packageManager field +
#     Corepack"). Bump it with `corepack use pnpm@<version>`, which also writes
#     the integrity hash. Parsed with sed, not node, so `make install` still
#     works before a Node runtime exists.
NODE_VERSION    := $(shell cat .nvmrc)
NODE_IMAGE_TAG  := $(NODE_VERSION)-alpine
PNPM_VERSION    := $(shell sed -n 's/.*"packageManager": *"pnpm@\([0-9.]*\).*/\1/p' package.json)
NGINX_IMAGE_TAG := 1.27-alpine
NVM_VERSION     := 0.40.4

export NODE_IMAGE_TAG
export PNPM_VERSION
export NGINX_IMAGE_TAG

.PHONY: install-docker install sync up down logs

install-docker: ## Install Docker
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/olafrv/my_collections/refs/heads/main/scripts/bash/install-docker.sh)"

install: ## Install nvm, Node.js, pnpm, and project dependencies
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$(NVM_VERSION)/install.sh | bash
	bash -c '. "$$HOME/.nvm/nvm.sh" && nvm install && nvm use && node -v && corepack enable pnpm && pnpm -v && pnpm install'

sync: ## Regenerate engines.node from .nvmrc
	@pnpm run sync:node-pin
	@echo "Synced: node=$(NODE_VERSION) pnpm=$(PNPM_VERSION) node-image=$(NODE_IMAGE_TAG) nginx=$(NGINX_IMAGE_TAG)"

up:
	docker compose -f docker/docker-compose.yml up -d --build

down:
	docker compose -f docker/docker-compose.yml down

logs:
	docker compose -f docker/docker-compose.yml logs -f
