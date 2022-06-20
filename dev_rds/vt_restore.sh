#! /bin/bash

RDS_USER="root"
RDS_PWD="Sand&lphon3"
VT_RDS_USER="cheiron"
VT_RDS_PWD="Neuromorphic"

## RDS Endpoint
SODA_RDS="test-soohyun-aurora-auroracluster.cluster-clbz1hjlobpr.ap-northeast-2.rds.amazonaws.com"
VT1_RDS="test-soohyun-vitess.cluster-clbz1hjlobpr.ap-northeast-2.rds.amazonaws.com"
VT2_RDS="test-soohyun-vitess-02-cluster.cluster-clbz1hjlobpr.ap-northeast-2.rds.amazonaws.com"
VT3_RDS="test-soohyun-vitess-03-cluster.cluster-clbz1hjlobpr.ap-northeast-2.rds.amazonaws.com"

MYSQL_BIN="/usr/bin/mysql"

## Vitess DB initialize
VT_SQL="DROP DATABASE IF EXISTS _vt;"

## Legacy soda initialize.
SODA_EXEC="${VT_SQL} USE soda; DROP TABLE IF EXISTS messagingchannellist_seq; SOURCE /home/deploy/soohyun/main_messagingchannellist.sql;"
${MYSQL_BIN} -A \
--user=${RDS_USER} \
--password=${RDS_PWD} \
--host=${SODA_RDS} \
--execute="${SODA_EXEC}"
echo "Legacy Initialize completed."

# Temp Keyspace physical database drop.
VT_SQL="${VT_SQL} DROP DATABASE IF EXISTS vt_temp;"
# messages Keyspace shard initialize.
VT_SQL="${VT_SQL} DROP DATABASE IF EXISTS vt_soda;"
VT_SQL="${VT_SQL} CREATE DATABASE IF NOT EXISTS vt_soda DEFAULT CHARACTER SET=utf8mb4 DEFAULT COLLATE=utf8mb4_bin;"

## Vitess initialize
${MYSQL_BIN} -A \
--user=${VT_RDS_USER} \
--password=${VT_RDS_PWD} \
--host=${VT1_RDS} \
--execute="${VT_SQL}"
echo "Shard 1 Initialize completed."

${MYSQL_BIN} -A \
--user=${VT_RDS_USER} \
--password=${VT_RDS_PWD} \
--host=${VT2_RDS} \
--execute="${VT_SQL}"
echo "Shard 2 Initialize completed."

${MYSQL_BIN} -A \
--user=${VT_RDS_USER} \
--password=${VT_RDS_PWD} \
--host=${VT3_RDS} \
--execute="${VT_SQL}"
echo "Shard 3 Initialize completed."
