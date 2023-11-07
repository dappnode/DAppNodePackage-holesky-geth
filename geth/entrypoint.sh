#!/bin/sh

case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_HOLESKY" in
"prysm-holesky.dnp.dappnode.eth")
  echo "Using prysm-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/prysm/jwtsecret.hex"
  ;;
"lighthouse-holesky.dnp.dappnode.eth")
  echo "Using lighthouse-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/lighthouse/jwtsecret.hex"
  ;;
"lodestar-holesky.dnp.dappnode.eth")
  echo "Using lodestar-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/lodestar/jwtsecret.hex"
  ;;
"teku-holesky.dnp.dappnode.eth")
  echo "Using teku-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/teku/jwtsecret.hex"
  ;;
"nimbus-holesky.dnp.dappnode.eth")
  echo "Using nimbus-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/nimbus/jwtsecret.hex"
  ;;
*)
  echo "Using default JWT"
  JWT_PATH="/security/default/jwtsecret.hex"
  ;;
esac

echo "[INFO - entrypoint] Posting JWT to dappmanager: ${JWT_PATH}"
JWT=$(cat $JWT_PATH)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"

echo "[INFO - entrypoint] Starting Geth"
exec geth --holesky --authrpc.jwtsecret ${JWT_PATH} ${EXTRA_FLAGS}
