FROM node:lts-buster

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

ADD . $NODE_WORKDIR

RUN apt-get update && apt-get install -y build-essential gcc wget git libvips && rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install

COPY . .

CMD ["node", "."]
