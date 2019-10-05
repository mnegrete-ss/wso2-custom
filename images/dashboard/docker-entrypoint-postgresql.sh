#!/bin/bash
set -e

# check if the WSO2 non-root user home exists
test ! -d ${WORKING_DIRECTORY} && echo "WSO2 Docker non-root user home does not exist" && exit 1

# check if the WSO2 product home exists
test ! -d ${WSO2_SERVER_HOME} && echo "WSO2 Docker product home does not exist" && exit 1

# volume mounts
config_volume=${WORKING_DIRECTORY}/wso2-config-volume

# replace environnment variables on configuration files
sed -i "s#{POSTGRESQL_DB_HOST}#${DB_HOST}#g" ${config_volume}/wso2/analytics/conf/dashboard/deployment.yaml
sed -i "s#{POSTGRESQL_DB_PORT}#${DB_PORT}#g" ${config_volume}/wso2/analytics/conf/dashboard/deployment.yaml

# call original entrypoint
( "/home/wso2carbon/docker-entrypoint.sh" )
