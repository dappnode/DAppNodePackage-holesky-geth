#!/bin/sh

echo "[INFO - entrypoint] Posting JWT to dappmanager: ${JWT_PATH}"
JWT=$(cat $JWT_PATH)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"

echo "[INFO - entrypoint] Starting Geth"
exec geth --holesky --authrpc.jwtsecret ${JWT_PATH} ${EXTRA_FLAGS}
