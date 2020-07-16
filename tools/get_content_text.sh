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
# Функция для записи строки в файл в указанную строку
fFile_Insert_StringByNumber()
{
   # args
   local arg_file="$1"
   local arg_string="$2"
   local arg_string_number="$3"
   local arg_mode="$4"
   # var
   local text_fix="DDD"

   # Для сохранения возможных пробелов перед текстом добавляем специальные символы
   arg_string="$text_fix$arg_string"

   # Проверяем режим вставки
   if [ $(echo "$arg_mode" | grep -c "\-a\|\-i\|-c") -ne 1 ]
   then
      echo "Incorrect insert mode! Use -a for add after string or -i for insert before string!"
      return 1
   else
      arg_mode="$(echo $arg_mode | sed 's/\-//g')"
   fi

   # Убеждаемся, что строка найдена
   if [ ! -z "$arg_string_number" ]
   then
      # Строка с нужной датой нашлась! Вставляем в файл новую дату в файл
      sed -r "$arg_string_number "$arg_mode" $arg_string" "$arg_file" > ./temp_file
      sed -r "s/$text_fix//1" ./temp_file > "$arg_file"
      rm -rf ./temp_file

      # Возвращаем номер строки в которую добавили, анализируя режим
      [ $arg_mode == "a" ] && echo $(( $arg_string_number + 1 )) || echo $arg_string_number
      return 0
   fi

   # echo "String $arg_string don't founded!"
   return 1
}

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
   # Сравниваем число скобок [[ и ]]. Оно должно быть одинаковым
   if [ $(cat "$_file" | grep -c "$_c_BEGIN_STR") != $(cat "$_file" | grep -c "$_c_END_STR") ]
   then
      echo "Error in src file!"
      exit 1
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
