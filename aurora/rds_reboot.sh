#!/bin/sh

AWS_BIN="/usr/local/bin/aws"

${AWS_BIN} rds reboot-db-instance \
--db-instance-identifier vt-shard01-01
