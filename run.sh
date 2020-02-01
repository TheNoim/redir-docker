#!/bin/sh

BIND_PORT=${PORT:=80}
TARGET__PORT=${TARGET_PORT:=80}

if [ -z ${TARGET_HOST+x} ]; 
then
	echo "You need to provide a target host"
	exit 1;
fi

echo "Target: $TARGET_HOST:$TARGET__PORT"
echo "Docker Port: $BIND_PORT"

redir -n :$BIND_PORT $TARGET_HOST:$TARGET__PORT