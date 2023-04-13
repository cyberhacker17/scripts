#!/bin/bash
#Esse script pode encontrar os subdominios de um site e seu endereço ip
if [ "$1" == "" ]
then
	echo "WHITEHACKER - PARSING HTML"
	echo "Modo de uso: $0 SITE"
	echo "Exemplo: $0 businesscorp.com.br"
else
echo "=================================================================================="


		echo "[+] Resolvendo URLs em: $1"


echo "=================================================================================="
wget $1 2> /dev/null
grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f1 | grep -v "<l" > $1.ip.txt
cat $1.ip.txt
echo "=================================================================================="

		echo "[+] Concluido: Salvando Resultados em: $1.ip.txt"

echo "=================================================================================="
for url in $(cat $1.ip.txt);do host $url | grep "has address";done
rm -rf index.html
fi
