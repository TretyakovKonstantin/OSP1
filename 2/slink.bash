#!/bin/bash

if [[ $# -eq 0 ]] 
then echo "Ошибка - не предоставлено аргументов" >&2
exit 1
fi
declare -a list
list="$1"/*
for file in $list
do
	check=$(find "$file"/* -type d -prune 2>/dev/null) #"$file"/* - because solaris doesn't have -maxdepth
	if [[ $? -eq 0 ]] 
	then
		if [[ -z $check ]]
		then echo "$file"
		fi
	fi
done
