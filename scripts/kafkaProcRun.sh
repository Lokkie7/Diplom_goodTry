#!/bin/sh

if ps -ef | grep kafka | grep -v grep | grep -E 'server.properties' > /dev/null
then
    echo "Kafka process is Running"
else
    echo "Kafka process is Stopped"
fi
