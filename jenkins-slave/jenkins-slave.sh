#!/bin/sh

wget -q "$MASTER_URL/jnlpJars/slave.jar"
exec java -jar slave.jar -jnlpUrl "$MASTER_URL/computer/$CLIENT_NAME/slave-agent.jnlp"
