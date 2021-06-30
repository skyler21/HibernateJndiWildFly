#!/bin/bash

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=standalone
JBOSS_CONFIG=$JBOSS_MODE.xml

function wait_for_server() {
  until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
    sleep 1
  done
}

echo "=> Starting WildFly server"
$JBOSS_HOME/bin/$JBOSS_MODE.sh -c $JBOSS_CONFIG -Djboss.server.config.dir=$JBOSS_HOME/$JBOSS_MODE/configuration/ &

echo "=> Waiting for the server to boot"
wait_for_server

echo "=> Executing the commands"
$JBOSS_CLI -c --file=$JBOSS_HOME/$JBOSS_MODE/configuration/commands.cli

echo "=> Shutting down WildFly"
$JBOSS_CLI -c ":shutdown"