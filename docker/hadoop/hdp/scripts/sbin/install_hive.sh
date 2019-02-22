#!/bin/bash -xe

apt-get install -y ${HIVE_PACKAGE} ${HIVE_PACKAGE}-server2

find /usr/hdp/current/hive-client/lib | grep '.jar' | \
    grep -E 'hive-jdbc|hive-common|hive-exec|hive-service|libfb303|libthrift' | \
    tr '\n' ':' > /opt/hive-jdbc-cp

source /usr/sbin/get_hive_home.sh
ln -sf /usr/share/java/mysql-connector-java.jar ${HIVE_HOME}/lib/mysql-connector-java.jar
