#!/bin/bash
echo ""
echo ""
echo "Закончилось место на диске"
df -h

echo "
Наибольшие директории и файлы:



Необходимо освободить место на диске или увеличить его объем. Сообщите какие данные можем удалить"

echo "******"
echo ""
echo "du -ah /  --max-depth=2 --exclude=/proc |grep G"
echo "du -ah /  --max-depth=12 --exclude=/proc |grep G|grep -v [0-9]M|grep -v [0-9]K|grep -vw 0"
