# Olaf Reitmaier

[![Better Stack Badge](https://uptime.betterstack.com/status-badges/v1/monitor/clx9.svg)](https://status.olafrv.com/)

Just my personal Website  https://www.olafrv.com/ and its related software stack.

## Development

First, setup your development environment:

* [Ubuntu Linux](https://ubuntu.com/).
* [Visual Studio Code](https://code.visualstudio.com/).
* [Vue Language Features (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

Second, install the app and test it locally:

```bash
# Install NodeJS in Ubuntu Linux (Jammy):
apt -y update
apt -y install make
# https://github.com/nodesource/distributions/blob/master/README.md
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs
npm run -l
npm run dev
# If you need it (latest docker official version)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/olafrv/my_collections/refs/heads/main/scripts/bash/install-docker.sh)"
```

Third, visit https://[olafrv.cloudflare.pages](https://olafrv.pages.dev/) (CNAME of olafrv.com) after commit and push.

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

