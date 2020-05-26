#!/bin/bash

echo curl $(dig +short @localhost -p 8600 l7-echo.service.consul srv | awk 'NR==1 { printf "%s:%s", substr($4, 0, length($4)-1), $3 }')
