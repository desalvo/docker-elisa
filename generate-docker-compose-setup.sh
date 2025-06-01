#!/bin/bash
CMDPATH="`dirname $0`"
if [ "`readlink -f $PWD`" == "`readlink -f $CMDPATH`" ] ; then
    echo "Please use a different directory to generate docker compose setup"
    exit 1
fi

export MARIADB_DATABASE=elisa_db
export MARIADB_HOST=elisa-db
export MARIADB_PORT=3306
export MARIADB_HOST_PORT=3307
export MARIADB_USER=elisa_config
export MARIADB_PASSWORD="$(tr -dc 'A-Za-z0-9$%&*+,-./:;<=>?@\^_' </dev/urandom | head -c 15; echo)"
export MARIADB_ROOT_PASSWORD="$(tr -dc 'A-Za-z0-9$%&*+,-./:;<=>?@\^_' </dev/urandom | head -c 15; echo)"

if [ -z "`type envsubst 2>/dev/null`" ] ; then
    echo "No envsubst command, please install it and re-run"
    exit 1
fi
cat $CMDPATH/elisa.yaml.template | envsubst > elisa.yaml
cat $CMDPATH/elisa_user_privileges.sql.template | envsubst > elisa_user_privileges.sql
ln -fs $CMDPATH/elisa.cnf .
ln -fs $CMDPATH/elisa_emptydb.sql .
[ ! -s application-mysql-local.properties.template ] && cp $CMDPATH/application-mysql-local.properties.template .
