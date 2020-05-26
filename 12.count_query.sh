#!/bin/bash

V1_COUNT=0
V2_COUNT=0
OTHER_COUNT=0

#while true
for i in {1..100}
	do
		RESPONSE=$(curl -s l7-api.service.consul:8989) 
		V1=$(echo ${RESPONSE}  | grep "V1")
		V2=$(echo ${RESPONSE}  | grep "V2")
		
		if [ "${V1}" != "" ]; then
			let V1_COUNT++
		elif [ "${V2}" != "" ]; then
			let V2_COUNT++
		else 
			let OTHER_COUNT++
		fi
	done

echo "   V1: ${V1_COUNT}"
echo "   V2: ${V2_COUNT}"
echo "Other: ${OTHER_COUNT}"
