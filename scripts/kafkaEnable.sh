#!/bin/sh

if systemctl list-unit-files | grep -E 'kafka' | grep enabled > /dev/null
then
    echo "Kafka process is Enabled"
else
    echo "Kafka process is Stopped"
fi
