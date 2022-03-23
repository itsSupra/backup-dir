#!/bin/bash
$1
$2
echo -n 'Проверка входящих параметров...'
if [ -z $2 ]; then
  echo 'FAIL'
  echo 'Ошибка в строке 5'
  echo 'Аргумент пропущен!'
  echo 'Для использования скрипта прочтите инструкцию в README.md'
  echo 'Формат использования скрипта: backup-dir path/to/source path/to/destination'
  exit
fi
echo 'OK'
if [ -f $2 ]; then 
  echo 'Destination существует, но не является директорией или симлинком на директорию!'
  echo 'Ошибка в строке 14!'
  echo 'Проверьте правильность введенного аргумента'
  exit
fi
echo 'Проверка на симлинк'
if [ -L $1 ]; then # я не смог присвоить $1=$sym, пришлось делать глуповато), но все работает
  echo 'Путь указывает на симплинк!'
  echo 'Обрезание пути для имени архивированной папки'
  sym=$(ls -l $1 | sed 's|.*>||')
  name=$(echo $sym | sed 's/\/$//g' | sed -n '/.*\//s///p')
  echo 'Добавление даты в нужном формате'
  date=$(date '+%Y-%m-%dT%k:%M:%S%:z')
  echo 'Соединение имени архивированной папки + даты'
  filename=$name-$date.tar.gz
  echo -n 'Генерация имени целевого файла...'
  if [ $filename = $name-$date.tar.gz ]; then
    echo 'OK'
  else
    echo 'FAIL'
    exit
  fi
  echo 'Архивирование'
  tar -czf $filename $sym
  echo -n 'Проверка наличия директории для сохранения бекапа...'
  if ! [ -d $2 ]; then
    echo 'OK'
    echo 'Нет директории'
    mkdir $2
    echo 'Директория создана'
  else
    echo 'OK'
  fi
  mv $filename $2
  echo 'Файл перемещен в указанную директорию'
  exit
fi
echo 'Обрезание пути для имени архивированной папки'
name=$(echo $1 | sed 's/\/$//g' | sed -n '/.*\//s///p')
echo 'Добавление даты в нужном формате'
date=$(date '+%Y-%m-%dT%k:%M:%S%:z')
echo 'Соединение имени архивированной папки + даты'
filename=$name-$date.tar.gz
echo -n 'Генерация имени целевого файла...'
if [ $filename = $name-$date.tar.gz ]; then
  echo 'OK'
else
  echo 'FAIL'
  exit
fi
echo 'Архивирование'
tar -czf $filename $1
echo -n 'Проверка наличия директории для сохранения бекапа...'
if ! [ -d $2 ]; then
  echo 'OK'
  echo 'Нет директории'
  mkdir $2
  echo 'Директория создана'
else
  echo 'OK'
fi
mv $filename $2
echo 'Файл перемещен в указанную директорию'
