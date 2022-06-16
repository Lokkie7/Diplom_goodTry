#!/bin/sh

if systemctl list-unit-files | grep -E 'zookeeper' | grep enabled > /dev/null
then
    echo "Zookeeper process is Enabled"
else
    echo "Zookeeper process is Disabled"
fi
