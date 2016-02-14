#!/bin/sh

export CATALINA_OPTS="$CATALINA_OPTS -Xms64m"
export CATALINA_OPTS="$CATALINA_OPTS -Xmx512m"
export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxPermSize=256m"
export CATALINA_OPTS="$CATALINA_OPTS -server"

#DATE=`date +'%Y%m%d-%H%M'`
#CATALINA_OPTS="-server -XX:MaxPermSize=256m -XX:PermSize=256m -XX:SurvivorRatio=2 -Xmn256 -Xmx256 -Xms256"
#CATALINA_OPTS="${CATALINA_OPTS} -XX:+PrintGCDetails -Xloggc:${CATALINA_BASE}/logs/gc.log.${DATE}"
#CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=3333 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=true"
#CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote.password.file=${CATALINA_BASE}/conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=${CATALINA_BASE}/conf/jmxremote.access"

echo "Using CATALINA_BASE: ${CATALINA_OPTS}"
export CATALINA_OPTS
