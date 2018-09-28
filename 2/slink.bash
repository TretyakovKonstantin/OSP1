#!/bin/bash

#Вывести список имён файлов в текущем каталоге, являющихся косвенными ссылками на указанный файл. Список отсортировать по времени изменения метаинформации
if [[ $# -eq 0 ]] 
then echo "Ошибка - не предоставлено аргументов" >&2
exit 1
fi

source="$1"
list=(`find . -type l | tr '\n' ' '`)
for file in ${list[@]}
do
	file=`echo $file | sed 's%^./%%'`
	check=`ls -l "$file" | sed 's/^.* -> //'`
	if [[ $check == $source ]] 
	then echo "$file"
	fi
done
