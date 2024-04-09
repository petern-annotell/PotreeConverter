#!/bin/bash
set -u
pushd /workspaces/PotreeConverter/build

for i in $( seq 1 200 ); do
  echo "---- $i ----"
  env LC_ALL=C ./PotreeConverter -o /tmp/intermediate_converted -i ../intermediate.las --attributes intensity gps-time rgb
  ret=$?
  echo "XXX Exit code: $ret"
  echo "XXX attrs: $( jq -r '.attributes[].name' /tmp/intermediate_converted/metadata.json )"
  echo "XXX scale: $( jq -r '.scale[]' /tmp/intermediate_converted/metadata.json )"
  n=$( jq -r '.attributes | length' "/tmp/intermediate_converted/metadata.json" )
  echo "XXX Attrs: $n"
  if [ "$n" != "4" ]; then 
    echo "XXX Woo! XXX"
    exit 1
  fi
done;
