#!/usr/bin/env bash

for f in ./fio-results-bs-4k-local/$1-*-$2; do

    action=`echo ${f} | awk -F "/" '{print $3}' | awk -F "-" '{print $2}'`
    iodepth=`echo ${f} | awk -F "/" '{print $3}' | awk -F "-" '{print $3}'`
    lat_grep=" lat ([u,m]sec):"
    iops_grep="iops"

    if [[ $f == *"read"* ]]; then
        echo "$action, iodepth=$iodepth, lat, read:" `grep -A 11 "read:" ${f} | grep -i "$lat_grep" | awk -F "," '{print $3}'`
        echo "$action, iodepth=$iodepth, iops, read:" `grep -A 11 -E "read:" ${f} | grep -i "$iops_grep" | awk -F "," '{print $3}'`
        echo "$action, iodepth=$iodepth, bandwidth, read:" `grep "read:" ${f} | awk -F "," '{print $2}' | awk -F "(" '{print $2}' | rev | cut -c 2- | rev`
    fi
    if [[ $f == *"write"* ]]; then
        echo "$action, iodepth=$iodepth, lat, write:" `grep -A 11 "write:" ${f} | grep -i "$lat_grep" | awk -F "," '{print $3}'`
        echo "$action, iodepth=$iodepth, iops, write:" `grep -A 11 -E "write:" ${f} | grep -i "$iops_grep" | awk -F "," '{print $3}'`
        echo "$action, iodepth=$iodepth, bandwidth, write:" `grep "write:" ${f} | awk -F "," '{print $2}' | awk -F "(" '{print $2}' | rev | cut -c 2- | rev`
    fi
    if [[ $f == *"rw"* ]]; then
        for operation in "read" "write"; do
	  echo "$action, iodepth=$iodepth, lat, $operation:" `grep -A 11 -E "$operation:" ${f} | grep -i "$lat_grep" | awk -F "," '{print $3}'`
          echo "$action, iodepth=$iodepth, iops, $operation:" `grep -A 11 -E "$operation:" ${f} | grep -i "$iops_grep" | awk -F "," '{print $3}'`
          echo "$action, iodepth=$iodepth, bandwidth, $operation:" `grep "$operation:" ${f} | awk -F "," '{print $2}' | awk -F "(" '{print $2}' | rev | cut -c 2- | rev`
	done
    fi

done
