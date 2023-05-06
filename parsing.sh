#!/bin/bash
#Version 1.8
if [ "$1" == "" ]
then
        echo -e "\e[33m\033[5m- - - - - - - - - - - - - - - - - - - - - -\e[0m\033[0m"
        echo -e "\e[34mWHITEHACKER - PARSING HTML\e[0m"
        echo -e "\e[34mModo de uso: $0 SITE\e[0m"
        echo -e "\e[34mExemplo: $0 businesscorp.com.br\e[0m"
        echo -e "\e[33m\033[5m- - - - - - - - - - - - - - - - - - - - - -\e[0m\033[0m"
else
echo -e "\e[33m\033[5m==================================================================================\e[0m\033[0m"


                echo -e "\e[35m\033[5m[+]\e[0m\033[0m \e[34mResolvendo URLs em: $1\e[0m"


echo -e "\e[033m\033[5m==================================================================================\e[0m\033[0m"
wget $1 2> /dev/null
grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f1 | grep -v "<l" > $1.ip.txt
cat $1.ip.txt
echo -e "\e[33m\033[5m==================================================================================\e[0m\033[0m"

                echo -e "\e[35m\033[5m[+]\e[0m\033[0m \e[34mConcluido: Salvando Resultados em: $1.ip.txt\e[0m"

echo -e "\e[33m\033[5m==================================================================================\e[0m\033[0m"
for url in $(cat $1.ip.txt);do host $url | grep "has address";done >> $1.ip.txt
cat $1.ip.txt | grep "has address"
rm -rf index.html
echo -e "\e[33m\033[5m==================================================================================\e[0m\033[0m"
fi
