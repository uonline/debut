#!/usr/bin/env bash
#-------------------------------------------------------------------------------------
#DESCRIPTOR---------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
# Скрипт для вывода содержательного текста игры в отдельный файл
# Скрипт обрабатывает файлы исходников и выводит из них строки, которые находятся между
#  строками с [[ и ]]
#MENU-DATA
#-------------------------------------------------------------------------------------
#CURRENT-TASK-------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#Секция целей
#-------------------------------------------------------------------------------------
#ARGS---------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#Секция аргументов
#-------------------------------------------------------------------------------------
#CONST--------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#Секция констант
_c_BEGIN_STR="\[\["
_c_END_STR="\]\]"
#-------------------------------------------------------------------------------------
#VAR----------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#Секция переменных
_this_script="$0"
_src_dir=""
_out_file="out.txt"
#-------------------------------------------------------------------------------------
#FUNCTIONS----------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#function NameFunc ()
#{
   #Descriptor - описание назначения
   #Interface - интерфейс функции
   #args
   #var

   #Implementation - реализация функции
#}

#-------------------------------------------------------------------------------------
#MAIN---------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
# Переходим в каталог скрипта
_this_script_path=`echo $_this_script | sed 's;\(.*\)\/.*;\1;'`
# echo "script path = "$_this_script_path
cd "$_this_script_path"'/../'

_src_dir="$(pwd)/src"
# Готовим выходной файл
_out_file="$(pwd)/$_out_file"
[ -f "$_out_file" ] && rm -rf "$_out_file"

# Готовим список файлов
_files=( $(find "$_src_dir" -type f | grep ".") )
# echo "${_files[*]}"

# Обходим список файлов
for _file in ${_files[*]}
do
   echo ""
   echo "Grab $_file..."

   echo "^" >> "$_out_file"
   echo "$_file..." >> "$_out_file"
   echo "^" >> "$_out_file"

   # Сравниваем число скобок [[ и ]]. Оно должно быть одинаковым
   if [ $(cat "$_file" | grep -c "$_c_BEGIN_STR") != $(cat "$_file" | grep -c "$_c_END_STR") ]
   then
      echo "Error in src file ($_file)!"
      continue
   fi
   # Получаем список номеров строк c [[
   _begin_list=( $(cat "$_file" | grep -n "$_c_BEGIN_STR" | sed 's/:.*//g') )
   # Получаем список номеров строк c ]]
   _end_list=( $(cat "$_file" | grep -n "$_c_END_STR" | sed 's/:.*//g') )

   # Debug
   # echo "${_begin_list[*]}"
   # echo "${_end_list[*]}"

   # Проходим по обоим спискам и выводим искомые строки в файл
   for (( _counter = 0; _counter < ${#_begin_list[*]}; _counter++ ))
   do
      # Обходим диапазон строк
      let _count=${_begin_list[$_counter]}+1
      while [ $_count -lt ${_end_list[$_counter]} ]
      do
         cat $_file | sed "$_count!D" | sed "s/{//g" | sed "s/}//g" | sed "s/--/-/g" | sed "s/\t//g" >> "$_out_file"
         let _count=$_count+1
      done
      echo "^" >> "$_out_file"
   done
done

cat $_out_file | tr -s '\n' ' ' > $_out_file".temp"
cat $_out_file".temp" | sed "s/\^/\r/g"  > $_out_file

#-------------------------------------------------------------------------------------
#EXAMPLE------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#ARCHIVE------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#META-COMMANDS------------------------------------------------------------------------
#-------------------------------------------------------------------------------------
#Секция мета-комманд для упрощения ведения отладки скрипта
#read -p "ATTENTION-1: stop - test block code!" #остановка перед блоком тестируемого кода