NODE_VERSION    := 24.15.0
NODE_IMAGE_TAG  := 24.15.0-alpine
PNPM_VERSION    := 11.1.2
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

sync: ## Sync versions into .nvmrc and package.json
	@echo "$(NODE_VERSION)" > .nvmrc
	@node -e " \
		const fs = require('fs'); \
		const p = JSON.parse(fs.readFileSync('package.json', 'utf8')); \
		p.engines = p.engines || {}; \
		p.engines.node = '$(NODE_VERSION)'; \
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
