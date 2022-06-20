#!/bin/sh

AWS_BIN="/usr/local/bin/aws rds"
SHARD_NAME="vt-shard01"

## DB Instance Delete
${AWS_BIN} delete-db-instance \
--db-instance-identifier "${SHARD_NAME}-02" \
--skip-final-snapshot \
--delete-automated-backups

${AWS_BIN} delete-db-instance \
--db-instance-identifier "${SHARD_NAME}-01" \
--skip-final-snapshot \
--delete-automated-backups

## Cluster Delete
${AWS_BIN} delete-db-cluster \
--db-cluster-identifier "${SHARD_NAME}" \
--skip-final-snapshot
