FROM node:24-slim AS builder

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git

WORKDIR /usr/src/app

COPY src src
COPY package-lock.json package-lock.json
COPY package.json package.json
COPY tsconfig.json tsconfig.json

RUN git config --global credential.helper "store --file /usr/src/app/.git-credentials"
RUN npm ci
RUN npm run build

FROM node:24-slim AS production

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openssl ca-certificates

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/build/ build/
COPY --from=builder /usr/src/app/node_modules/ node_modules/
COPY --from=builder /usr/src/app/package-lock.json package-lock.json
COPY --from=builder /usr/src/app/package.json package.json

ENV APP_PORT=3000

EXPOSE 3000

CMD ["node", "build/src/index.js"]
