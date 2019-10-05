#set base docker image
FROM wso2/wso2ei-broker:6.5.0

# set arguments
ARG WSO2_SERVER_NAME=wso2ei
ARG WSO2_SERVER_VERSION=6.5.0
ARG POSTGRESQL_JDBC_VERSION=42.2.8
# calculated/fixed arguments
ARG USER=wso2carbon
ARG WSO2_SERVER=${WSO2_SERVER_NAME}-${WSO2_SERVER_VERSION}
ARG WSO2_SERVER_HOME=${USER_HOME}/${WSO2_SERVER}
ARG USER_HOME=/home/${USER}

# add libraries for postgresql jdbc
ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRESQL_JDBC_VERSION}/postgresql-${POSTGRESQL_JDBC_VERSION}.jar ${WSO2_SERVER_HOME}/dropins/

# copy custom entrypoint
COPY --chown=wso2carbon:wso2 docker-entrypoint-postgresql.sh ${USER_HOME}/

# initiate container and start WSO2 Carbon server
ENTRYPOINT ["/home/wso2carbon/docker-entrypoint-postgresql.sh"]

