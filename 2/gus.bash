#!/bin/bash

if [[ $# = 0 ]]
	then echo "Пожалуйста, предоставьте аргументы" >&2
fi

groups=(`getent group "$1" | tr ':' ' ' | tr ',' ' '`)
unset groups[0]
unset groups[1] 
for group in ${groups[*]}
do
	echo "$group"
done

