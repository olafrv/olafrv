# Olaf Reitmaier

[![Better Stack Badge](https://uptime.betterstack.com/status-badges/v1/monitor/clx9.svg)](https://status.olafrv.com/)

Just my personal Website  https://www.olafrv.com/ and its related software stack.

## Development

First, setup your development environment:

* [Ubuntu Linux](https://ubuntu.com/).
* [Visual Studio Code](https://code.visualstudio.com/).
* [Vue Language Features (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur). See [.vscode/extensions.json](.vscode/extensions.json) for recommended extensions.

Second, install [Node.js, nvm, pnpm](https://nodejs.org/en/download) and project dependencies (versions pinned in [Makefile](Makefile)):

```bash
make install
make install-docker  # install Docker and Docker Compose (optional)
```

## Daily Development

See [README_PNPM.md](README_PNPM.md) for pnpm usage, security configuration, and package management commands.

## Version Management

All pinned main package versions (Node.js, pnpm, Nginx) live in one place — the top of [Makefile](Makefile), after editing those values, run `make sync` to propagate them to `.nvmrc` and `package.json`.

```bash
make sync
```

## Docker Compose

```bash
make up      # build and start nginx
make down    # stop and remove containers
make logs    # follow container logs
```

## Deployment to CloudFlare Pages

Finally, visit https://[olafrv.cloudflare.pages](https://olafrv.pages.dev/) (CNAME of olafrv.com) after commit and push.

> This is the reason why README is named README_.md, to avoid GitHub Pages picking it up as the default README.md and showing it on the website instead of the actual content. The deployment is now handled by CloudFlare Pages, which is more suitable for this use case.

## References

### Vite

* https://vitejs.dev/config/
* https://www.npmjs.com/package/vite-plugin-vuetify
* https://vuejs.org/guide/essentials/component-basics.html#dynamic-components

### VueJS

* https://vuejs.org/guide/quick-start.html (Composition API)
* https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
* https://vuejs.org/guide/essentials/template-syntax.html

### Vuetify

* https://vuetifyjs.com/en/getting-started/installation/
* https://next.vuetifyjs.com/en/features/treeshaking/

### Vue Router

* https://router.vuejs.org/guide/#javascript

### Pinia

* https://pinia.esm.dev/

### Material Design

* https://m2.material.io/
* https://pictogrammers.com/library/mdi/

### ESLint & Prettier

* https://eslint.org/
* https://prettier.io/
* https://github.com/prettier/eslint-config-prettier
* https://github.com/prettier/prettier-vscode

### CloudFlare Pages

* https://developers.cloudflare.com/pages/
* https://developers.cloudflare.com/dns/cname-flattening/
* https://developers.cloudflare.com/pages/platform/limits
* https://www.cloudflare.com/ips/

### GitHub Pages & Actions (Deprecated)

> Don't forget GitHub Pages > Select branch and Workflow > Add permissions

* https://vitejs.dev/guide/static-deploy.html
* https://docs.github.com/en/pages/quickstart
* https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site
* https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge

