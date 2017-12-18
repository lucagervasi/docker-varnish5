#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -F \
  -f $VCL_CONFIG \
  -s malloc,$CACHE_SIZE \
  -a 0.0.0.0:80 \
  -a 0.0.0.0:6086,PROXY \
  $VARNISHD_PARAMS"
