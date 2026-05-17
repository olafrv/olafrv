# ---- Build Stage ---------------------------------------------------------
FROM node:24.15.0-alpine AS build-stage

WORKDIR /app

# Copy only metadata first – this allows caching of deps
COPY package*.json pnpm-lock.yaml ./

RUN corepack enable \
    && corepack prepare pnpm@11 --activate \
    && pnpm install --frozen-lockfile

# Now copy the rest of the source code
COPY ./ .

# Build the application
RUN pnpm build

# ---- Production Stage ----------------------------------------------------
FROM nginx:1.27-alpine AS production

# Copy built assets
COPY --from=build-stage /app/dist /usr/share/nginx/html

RUN chown -R app:app /usr/share/nginx/html
# Optional: configure Nginx if you have custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Set non‑root user (optional, depends on your image)
RUN addgroup -S app && adduser -S app -G app
USER app

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
