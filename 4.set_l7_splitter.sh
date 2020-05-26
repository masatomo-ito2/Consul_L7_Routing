#!/bin/bash

#if [ $# -ne 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

consul config write service-router-splitter.hcl 
consul config write service-resolver-splitter.hcl
