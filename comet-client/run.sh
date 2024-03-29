#!/bin/sh
#
#
#
#


url=$1;
n=$2;
max=$3;
delay=$4;
filename=$n-$max-$delay-$(date +%s)-log.txt
echo $filename;

log_file=$(date +%s)-log.txt

mvn exec:java -Dexec.mainClass="org.jboss.web.comet.CometServletClientTest" -Dexec.args="$url $n $max $delay" > $log_file

printf "max \t min \t avg\n" > $filename
cat $log_file | egrep -v '[a-zA-Z]|^\s*$' >> $filename

mvn exec:java -Dexec.mainClass="org.jboss.web.comet.LogParser" -Dexec.args="$filename"
