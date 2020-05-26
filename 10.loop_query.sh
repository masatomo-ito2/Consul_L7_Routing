#!/bin/bash

while true
	do
		#curl $(dig +short @localhost -p 8600 l7-echo.service.consul srv | awk 'NR==1 { printf "%s:%s", substr($4, 0, length($4)-1), $3 }')
		curl l7-api.service.consul:8989
		echo
		sleep 1.0
	done
