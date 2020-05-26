#!/bin/bash

#if [ $# -ne 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

consul config delete -kind service-router -name l7-api 
consul config delete -kind service-resolver -name l7-api
consul config delete -kind service-splitter -name l7-api
consul config delete -kind service-defaults -name l7-api
