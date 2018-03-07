#!/bin/bash

md5sum /etc/crontab > /tmp/ex04

if [ ! -d /tmp/checkcrontab.sh];
then
	echo "if [ \$(md5sum --check /tmp/ex04 | grep \"FAILED\" | wc -w) != 0];" > /tmp/checkcrontab.sh
	echo "then" >> /tmp/checkcrontab.sh
	echo "mail -s \" crontab modified\" root" >> /tmp/checkcrontab.sh
	echo "md5sum /etc/crontab > /tmp/ex04" >> /tmp/checkcrontab.sh
	echo "fi" >> /tmp/checkcrontab.sh
fi

touch /tmp/crontmp

echo "0 0 * * * (sh /tmp/checkcrontab.sh)" > /tmp/crontmp

crontab /tmp/crontmp
rm /tmp/crontmp
