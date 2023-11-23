#!/bin/bash
#записываем текст из буфера обмена в файл
xclip -o clip > temp.txt
#берем ip и title
ip=$(grep "<IP_Address>" temp.txt|sed "s/<IP_Address>//; s/<\/IP_Address>//")
title=$(grep "<Title>" temp.txt|sed "s/<Title>//; s/<\/Title>//")
#выводит ip и title, можно убрать
echo $ip
echo $title
#подставляем ip и title в шаблон (нужно его иметь)
cat abusetitle |sed "s/IPADDRESS/$ip/"|sed "s/TITLE/$title/" > end
#дописываем наш скопированный текст в конец конечного файла
xclip -o clip >> end
#закрываем noformat
echo {noformat} >> end
#копируем файл в буфер обмена
xclip -sel clip end
~
