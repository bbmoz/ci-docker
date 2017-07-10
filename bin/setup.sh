#!/usr/bin/env bash

set -e

echo -e "${PROJECT_DIR?Please set PROJECT_DIR}"
echo -e "${DB_USER?Please set DB_USER}"
echo -e "${DB_PASS?Please set DB_PASS}"
echo -e "${WEB_USER?Please set WEB_USER}"
echo -e "${WEB_PASS?Please set WEB_PASS}"
echo -e "${WEB_EXTERNAL_URL?Please set WEB_EXTERNAL_URL}"
echo -e "${MINIO_ACCESS_KEY?Please set MINIO_ACCESS_KEY}"
echo -e "${MINIO_SECRET_KEY?Please set MINIO_SECRET_KEY}"

pushd ${PROJECT_DIR}
  if [ ! -f .env ]; then
    echo "Please create an .env file to source"
  fi

  mkdir -p keys/web keys/worker
  ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
  ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''
  ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''
  cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys
  cp ./keys/web/tsa_host_key.pub ./keys/worker
popd
