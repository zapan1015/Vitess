#!/bin/sh

AWS_BIN="/usr/local/bin/aws rds modify-db-instance --db-instance-identifier"
VT_RDS_1="sb-rds-test-soohyun-aurora-master"
VT_RDS_2="vt-shard01-01"
VT_RDS_3="test-soohyun-vitess-03-cluster"

${AWS_BIN} ${VT_RDS_1} \
--db-parameter-group-name vt-soohyun-gtid-on

${AWS_BIN} ${VT_RDS_2} \
--db-parameter-group-name vt-soohyun-gtid-on

${AWS_BIN} ${VT_RDS_3} \
--db-parameter-group-name vt-soohyun-gtid-on


eks-cluster-sg-vitesstestsoohyun-eks-vt-1985616420 (sg-08ae73190fb5f8a09)
( 활성 )
test-soohyun-internal-sg (sg-00a1eb408a703b409)
( 활성 )