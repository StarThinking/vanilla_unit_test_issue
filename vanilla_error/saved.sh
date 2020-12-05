#!/bin/bash

# untar
for i in hdfs*; do cd $i; for j in *; do tar zxvf $j; rm $j; done; cd -; done

for i in hdfs*; do grep -r 'msx-rc 1' $i ; done | awk -F '/' '{print $2}' | awk -F '-output.txt' '{print $1}' | sort | uniq -c | sort -k1 -n

grep -r 'msx-rc 0' hdfs* | awk -F ':msx-rc 0' '{print $1}' | xargs rm
