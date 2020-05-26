#!/bin/bash

#if [ $# -ne 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

consul config delete -kind service-splitter -name l7-api
consul config write service-resolver.hcl 
consul config write service-router.hcl
