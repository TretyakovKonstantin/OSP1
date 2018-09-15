#!/bin/bash
echo "Список команд (вариант 8):" 
echo "1 - Напечатать имя текущего каталога." 
echo "2 - Сменить текущий каталог." 
echo "3 - Создать файл." 
echo "4 - Предоставить всем право на запись в файл." 
echo "5 - Удалить файл." 
echo "6 - Выйти из программы."
log_file=~/OSP/lab1_err 
err_msg="Произошла ошибка."

continue=true
IFS=
while $continue && read input 
do 
case $input in 
"1" ) 
if [ -d $(pwd) ] 
then 
pwd 2>> $log_file 
else 
echo $err_msg >&2 
fi 
;;
"2" ) 
echo "Введите путь к каталогу:" 
read dir || exit 0
cd -- "$dir" 2>> $log_file || echo $err_msg >&2
;;
"3" ) 
echo "Введите имя файла:" 
read file || exit 0
eval "touch '$file'" 2>> $log_file || echo $err_msg >&2
;;
"4" ) 
echo "Введите путь к файлу:" 
read file || exit 0
chmod -- a+w "$file" 2>> $log_file || echo $err_msg >&2
;;
"5" ) 
echo "Введите путь к файлу:" 
read file || exit 0
if [ -f "$file" ] 
then 
echo "rm: $file (yes/no)?" 
read confirmation || exit 0
if [ $confirmation = yes ] 
then 
eval "rm $file" 2>> $log_file || echo $err_msg >&2 
fi 
else 
echo "Файл не найден." | tee -a >&2 $log_file
fi
;;
"6" ) 
continue=false 
echo "Goodbye, sweet prince" 
;; 
esac

if $continue 
then 
echo "Введите следующую команду:" 
fi 
done

