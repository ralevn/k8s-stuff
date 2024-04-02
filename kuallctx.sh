#!/usr/bin/env bash

COMMAND=

while [ "$1" != ""  ]; do
        COMMAND="$COMMAND $1"
        shift
done


CURRENTCONTEXT=$(kubectl config current-context)

for cont in $(kubectl config get-contexts --no-headers|awk '{print $2}')
do
        echo
        echo Context: $cont
        echo "----------------"
        kubectl --context $cont $COMMAND
done
echo
kubectl config use-context $CURRENTCONTEXT
echo

