FROM elixir:alpine
ARG APP_NAME=wood_bullet
ARG PHOENIX_SUBDIR=./modules/client/
ENV MIX_ENV=prod REPLACE_OS_VARS=true TERM=xterm PORT=8000
WORKDIR /opt/app
RUN apk update \
    && apk --no-cache --update add nodejs nodejs-npm \
    && mix local.rebar --force \
    && mix local.hex --force
COPY . .
RUN cd ${PHOENIX_SUBDIR} \
  && mix do deps.get, deps.compile, compile \
  && cd ..
RUN cd ${PHOENIX_SUBDIR}/assets \
    && npm install \
    && ./node_modules/brunch/bin/brunch build -p \
    && cd .. \
    && mix phx.digest
RUN mix release --env=prod --verbose \
    && mv _build/prod/rel/${APP_NAME} /opt/release \
    && mv /opt/release/bin/${APP_NAME} /opt/release/bin/start_server
FROM alpine:latest
RUN apk update && apk --no-cache --update add bash openssl-dev
ENV PORT=8080 MIX_ENV=prod REPLACE_OS_VARS=true
WORKDIR /opt/app
EXPOSE ${PORT}
COPY --from=0 /opt/release .
CMD ["/opt/app/bin/start_server", "foreground"]
