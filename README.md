ИНСТРУКЦИЯ!!!
Для использование скрипта введите в консоле:
$ alias backup-dir='function backup-dir(){ bash /Users/ciberdroon/PhpstormProjects/backup-dir/backup-dir.sh $1 $2;};backup-dir'
После bash путь к скрипту)
Мы установили псевдоним для backup-dir
Далее можно использовать скрипт по команде:
$ backup-dir path/to/source path/to/destination
Скрипт может запросить права доступа для чтения, просмотра и записи директории
Для этого пропишем:
$ chmod a+x /path/to/directory
Путь к запрашиваемой директории
