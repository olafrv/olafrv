ARG NODE_VERSION
ARG PNPM_VERSION
ARG NGINX_VERSION

FROM node:${NODE_VERSION} AS build-stage

ARG PNPM_VERSION

WORKDIR /app

# Copy only metadata first – this allows caching of deps
COPY package*.json pnpm-lock.yaml .pnpmfile.cjs ./

RUN corepack enable \
    && corepack prepare pnpm@${PNPM_VERSION} --activate \
    && pnpm install --frozen-lockfile --ignore-scripts \
    && pnpm rebuild esbuild

# Now copy the rest of the source code
COPY ./ .

# Build the application
RUN pnpm build

# ---- Production Stage ----------------------------------------------------
FROM nginx:${NGINX_VERSION} AS production

# Copy built assets
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /usr/share/nginx/html \
    && mkdir -p /var/cache/nginx /var/run /run \
    && chown -R nginx:nginx /var/cache/nginx /var/run /run

USER nginx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
