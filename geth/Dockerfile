ARG UPSTREAM_VERSION

FROM ethereum/client-go:${UPSTREAM_VERSION}

COPY /security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apk update && apk add curl && \ 
    chmod +x /usr/local/bin/entrypoint.sh

ENV GETH_AUTHRPC_ADDR=0.0.0.0 GETH_AUTHRPC_PORT=8551 GETH_AUTHRPC_VHOSTS=* GETH_DATADIR=/root/.ethereum

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
