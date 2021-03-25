FROM alemayhu/base-image-n2a

RUN mkdir -pv /tmp/workspaces
RUN mkdir -pv /tmp/uploads
WORKDIR /app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

ENV PORT 8080
EXPOSE 8080

CMD ["/app/node_modules/.bin/imba", "server/server.js"]
