FROM node:16-alpine

RUN npm install -g pnpm

WORKDIR /app

COPY package*.json pnpm-lock.yaml ./

RUN pnpm i

COPY . .

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

RUN pnpm run build

CMD [ "pnpm", "dev" ]