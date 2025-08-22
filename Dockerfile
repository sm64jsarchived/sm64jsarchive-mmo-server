FROM debian:buster-slim

RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list \
    && apt-get update -o Acquire::Check-Valid-Until=false \
    && apt-get install -y --no-install-recommends \
        pkg-config \
        openssl \
        libssl-dev \
        iproute2 \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=gmanthemarioguy/sm64jsarchive-mmo-server:latest /sm64js/target/release/sm64js ./sm64js
COPY ./openapi ./openapi
COPY --from=gmanthemarioguy/sm64jsarchive-assets:latest /usr/src/app/dist ./dist

CMD ["./sm64js"]
