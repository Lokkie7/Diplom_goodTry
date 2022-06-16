#!/bin/sh

if ps -ef | grep kafka | grep -v grep | grep -E 'zookeeper.properties' > /dev/null
then
    echo "Zookeeper process is Running"
else
    echo "Zookeeper process is Stopped"
fi

