#!/bin/sh

AWS_BIN="/usr/local/bin/aws rds"
SHARD_NAME="vt-shard01"

## Cluster Create
${AWS_BIN} create-db-cluster \
--availability-zones "ap-northeast-2a" "ap-northeast-2b" \
--backup-retention-period 1 \
--database-name "vt_soda" \
--db-cluster-identifier "${SHARD_NAME}" \
--db-cluster-parameter-group-name "vt-cluster-param" \
--vpc-security-group-ids "sg-08ae73190fb5f8a09" "sg-00a1eb408a703b409" \
--db-subnet-group-name "testsoohyun-aurora-dbsubnetgroup-1ccxwlheqmscs" \
--engine "aurora-mysql" \
--engine-version "5.7.12" \
--master-username "cheiron" \
--master-user-password "Neuromorphic" \
--preferred-backup-window "15:50-16:20" \
--preferred-maintenance-window "sat:19:00-sat:19:30" \
--tags "Key=region_owner,Value=soohyun" "Key=sendbird_region,Value=test-soohyun" "Key=test-soohyun,Value=true" \
--storage-encrypted \
--kms-key-id "arn:aws:kms:ap-northeast-2:-:key/848b1f46-6db6-48d6-8e49-717be7d19698" \
--no-enable-iam-database-authentication \
--no-deletion-protection \
--no-enable-http-endpoint \
--copy-tags-to-snapshot

## Instance Create.
${AWS_BIN} create-db-instance \
--db-instance-identifier "${SHARD_NAME}-01" \
--db-instance-class "db.t3.small" \
--engine "aurora-mysql" \
--db-subnet-group-name "testsoohyun-aurora-dbsubnetgroup-1ccxwlheqmscs" \
--preferred-maintenance-window "sun:17:00-sun:17:30" \
--db-parameter-group-name "vt-db-param" \
--no-multi-az \
--no-auto-minor-version-upgrade \
--no-publicly-accessible \
--tags "Key=region_owner,Value=soohyun" "Key=sendbird_region,Value=test-soohyun" "Key=test-soohyun,Value=true" \
--db-cluster-identifier "vt-shard01" \
--copy-tags-to-snapshot \
--no-enable-performance-insights

${AWS_BIN} create-db-instance \
--db-instance-identifier "${SHARD_NAME}-02" \
--db-instance-class "db.t3.small" \
--engine "aurora-mysql" \
--db-subnet-group-name "testsoohyun-aurora-dbsubnetgroup-1ccxwlheqmscs" \
--preferred-maintenance-window "sun:17:00-sun:17:30" \
--db-parameter-group-name "vt-db-param" \
--no-multi-az \
--no-auto-minor-version-upgrade \
--no-publicly-accessible \
--tags "Key=region_owner,Value=soohyun" "Key=sendbird_region,Value=test-soohyun" "Key=test-soohyun,Value=true" \
--db-cluster-identifier "vt-shard01" \
--copy-tags-to-snapshot \
--no-enable-performance-insights
