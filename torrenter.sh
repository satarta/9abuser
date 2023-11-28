#!/bin/bash

# Извлечение IP и заголовка из буфера обмена
ip=$(xclip -o clip | grep -oP '<IP_Address>\K.*?(?=<\/IP_Address>)')
title=$(xclip -o clip | grep -oP '<Title>\K.*?(?=<\/Title>)')

# Замена шаблонов в файле abusetitle и сохранение результата во временный файл
sed "s/IPADDRESS/$ip/; s/TITLE/$title/" ~/texts/abusetitle > temp_end

# Добавление {noformat} и контента из буфера обмена в конечный файл
xclip -o clip >> temp_end
echo "{noformat}" >> temp_end
# Копирование конечного файла в буфер обмена
xclip -sel clip temp_end

# Удаление временных файлов
rm temp_end
