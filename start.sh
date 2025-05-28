#!/bin/bash

export MARIADB_DATABASE=${MARIADB_DATABASE:-elisa_db}
export MARIADB_HOST=${MARIADB_HOST:-localhost}
export MARIADB_PORT=${MARIADB_PORT:-3306}
export MARIADB_USER=${MARIADB_USER:-logbook}

export ELISA_HOME=${ELISA_HOME:-/var/local/elisa}
export ELISA_USER=${ELISA_USER:-logbook}

TMPFILE=/tmp/elisa.tmp.$$

mkdir ${ELISA_HOME}/config
cat /application-mysql-local.properties.template | envsubst > ${ELISA_HOME}/config/application-mysql-local.properties
if [ -n "$ELISA_DEFINEDORDER" ] ; then
    echo $ELISA_DEFINEDORDER | sed -e 's/\s*//g' -e 's/\s*,/,\\\\\\\n/g' > $TMPFILE
    sed -i -E "s/@DEFINEDORDER@/elisa.config.definedOrder.SA = \\\\\n`cat $TMPFILE`/g" ${ELISA_HOME}/config/application-mysql-local.properties
else
    sed -i "s/@DEFINEDORDER@//g" ${ELISA_HOME}/config/application-mysql-local.properties
fi
rm -f $TMPFILE
chown -R ${ELISA_USER}:${ELISA_USER} ${ELISA_HOME}/config

${ELISA_HOME}/elisa.jar
[ $ELISA_DEBUG -ge 1 ] && sleep 10h
