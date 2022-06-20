#!/bin/sh

AWS_BIN="/usr/local/bin/aws"
WORK_DIR="vitess/aurora"

${AWS_BIN} rds modify-db-cluster-parameter-group \
--db-cluster-parameter-group-name vt-cluster-param \
--cli-input-json file://modi-cluster-param.json

/bin/sh ${WORK_DIR}/rds_reboot.sh
