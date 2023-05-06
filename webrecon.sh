#!/bin/bash
if [ "$1" == "" ]
then
echo "SCRIPT - WEBRECON"
echo "Modo de uso: ./webrecon.sh SITE php"
else
server=$(curl -s --head $1 | grep "Server:" | cut -d ":" -f2)
tecnologia=$(curl -s --head businesscorp.com.br | grep "Content-Type:" | cut -d ":" -f2)
echo -e "\e[33m=================================================================\e[0m"
echo -e "\e[33m\033[5m->\e[0m\033[0m \e[34mwebServer indentificado: $server\e[0m"
echo -e "\e[33m\033[5m->\e[0m\033[0m \e[34mTecnologia: $tecnologia\e[0m"

Encontrar_Diretórios() {
	resposta=$(curl -s -H "User-Agent: whiteTool" -o /dev/null -w "%{http_code}" $1/$palavra/)

	if [ $resposta == "200" ]
	then
       		echo -e "\e[34mDiretório encontrado: $1/$palavra/\e[0m"
	fi
}


Encontrar_Arquivos() {
	resposta=$(curl -s -H "User-Agent: whiteTool" -o /dev/null -w "%{http_code}" $1/$palavra.$2)

        if [ $resposta == "200" ]
        then
                echo -e "\e[34mArquivo encontrado: $1/$palavra.$2\e[0m"
	fi
}

echo -e "\e[33m=================================================================\e[0m"
echo -e "\e[34mPROCURANDO POR AQRUIVOS E DIRETÓRIOS\e[0m"
echo -e "\e[33m=================================================================\e[0m"
for palavra in $(cat lista2.txt)
do
Encontrar_Diretórios $1
done
echo -e "\e[33m=================================================================\e[0m"
for palavra in $(cat lista2.txt)
do
Encontrar_Arquivos $1 $2 
done
echo -e "\e[33m=================================================================\e[0m"
fi
