FROM electronuserland/builder:wine

WORKDIR /workspace

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ENV PORT=3001 \
    BUILD_SERVICE_PORT=3001 \
    BUILD_DIST_DIR=/workspace/docker-dist \
    BUILD_OUTPUT_DIR=/workspace/artifacts \
    BUILD_STATE_DIR=/workspace/build-service-data \
    BUILD_COMMAND="npm run build:win -- --config.directories.output=docker-dist"

EXPOSE 3001

CMD ["node", "tools/build-agent/server.js"]