# .nvmrc is the single source of truth for the Node version; everything else
# is derived from it. See PNPM_SECURITY.md -> "Node version - single source of
# truth". To bump Node: edit .nvmrc, run `make sync`, commit both files.
NODE_VERSION    := $(shell cat .nvmrc)
NODE_IMAGE_TAG  := $(NODE_VERSION)-alpine
PNPM_VERSION    := 11.6.0
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

sync: ## Sync pins into package.json (.nvmrc is the source of truth for Node)
	@pnpm run sync:node-pin
	@node -e " \
		const fs = require('fs'); \
		const p = JSON.parse(fs.readFileSync('package.json', 'utf8')); \
		p.engines = p.engines || {}; \
		p.engines.pnpm = '$(PNPM_VERSION)'; \
		p.packageManager = 'pnpm@$(PNPM_VERSION)'; \
		fs.writeFileSync('package.json', JSON.stringify(p, null, 2) + '\n'); \
	"
	@echo "Synced: node=$(NODE_VERSION) pnpm=$(PNPM_VERSION) node-image=$(NODE_IMAGE_TAG) nginx=$(NGINX_IMAGE_TAG)"

up:
	docker compose -f docker/docker-compose.yml up -d --build

down:
	docker compose -f docker/docker-compose.yml down

logs:
	docker compose -f docker/docker-compose.yml logs -f
