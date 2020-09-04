# Build application
FROM node:12 AS builder
WORKDIR /app
COPY ./package.json ./pnpm-lock.yaml ./
RUN curl -L https://raw.githubusercontent.com/pnpm/self-installer/master/install.js | node
RUN pnpm install
COPY . .
RUN pnpm build
RUN pnpm prune --prod

# Run application
FROM node:12-alpine
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 4000
CMD ["node", "./dist/index.js"]
