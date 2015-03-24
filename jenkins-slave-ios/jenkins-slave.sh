#!/bin/sh
#export MASTER_URL="http://jenkins.host:8080"
#export CLIENT_NAME="xcode.host"

wget -q "$MASTER_URL/jnlpJars/slave.jar"
exec java -jar slave.jar -jnlpUrl "$MASTER_URL/computer/$CLIENT_NAME/slave-agent.jnlp"
