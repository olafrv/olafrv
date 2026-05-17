FROM node:latest AS build-stage
WORKDIR /app
COPY package*.json ./
RUN corepack enable && corepack prepare pnpm@11 --activate && pnpm install --frozen-lockfile
COPY ./ .
RUN pnpm build

FROM nginx:latest AS production
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]