#!/bin/bash

if [[ $# = 0 ]]
	then echo "Пожалуйста, предоставьте аргументы" >&2
fi

groups=(`getent group "$1" | tr ':' ' ' | tr ',' ' '`)
for group in ${groups[*]:2:${#groups[*]}}
do
	echo "$group"
done

