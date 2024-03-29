#Version 1.8
#script criado por: cyberhack17
#PARA UTILIZAR O SCRIPT É NECESSARIO TER O "CURL"
#Esse script lista os diretórios e arquivos de um site 
#NECESSÁRIO TER UMA WORDLIST
#PARA SABER COMO USAR EXECUTE O SCRIPT SEM ARGUMENTO(./webrecon.sh)
#!/bin/bash
if [ "$1" == "" ]
then
        echo "SCRIPT - WEBRECON"
        echo "Modo de uso: ./webrecon.sh SITE php"
        echo "CURL IS NECESSARY"
        exit 1
fi
status=$(curl -s -A "whiteTool" -I $1)
server=$(curl -s --head $1 | grep "Server:" | cut -d ":" -f2)
tecnologia=$(echo "$status" | grep -E "X-Powered-By" | cut -d ":" -f 2)
echo -e "\e[33m\033[5m->\e[0m\033[0m \e[34mwebServer indentificado: $server\e[0m"
if [ "$tecnologia" == "" ]
then
        echo -e "\e[33m\033[5m->\e[0m\033[0m \e[34mTecnologia não indentificada\e[0m"
else
echo -e "\e[33m=================================================================\e[0m"
echo -e "\e[33m\033[5m->\e[0m\033[0m \e[34mTecnologia: $tecnologia\e[0m"
fi  
Encontrar_Diretórios() {
        resposta=$(curl -s -H "User-Agent: whiteTool" -o /dev/null -w "%{http_code}" $1/$palavra/)

        if [ "$resposta" == "200" ]
        then
                echo -e "\e[34mDiretório encontrado: $1/$palavra/\e[0m"
        fi
}
 

Encontrar_Arquivos() {
        echo "pesquisando: $1/$palavra.$2"
        resposta=$(curl -s -H "User-Agent: whiteTool" -o /dev/null -w "%{http_code}" $1/$palavra.$2)

        if [ "$resposta" == "200" ]
        then
                echo -e "Arquivo encontrado: $1/$palavra.$2"
        else
                echo -e "Arquivo não encontrado: $1/$palavra.$2"
        fi
}

echo -e "\e[33m=================================================================\e[0m"
echo -e "\e[34mDeseja procurar por arquivos ou diretorios?\e[0m"
read resposta
echo -e "\e[33m=================================================================\e[0m"
if [ "$resposta" == "diretorios" ]
then    
        echo -e "\e[34mPROCURANDO POR DIRETÓRIOS\e[0m"
        echo -e "\e[33m=================================================================\e[0m"
        #coloque aqui sua wordlist para os diretorios
        for palavra in $(cat /usr/share/wordlists/dirb/big.txt)
        do
                Encontrar_Diretórios $1 
        done
else
        echo -e "\e[34mPROCURANDO POR AQRUIVOS\e[0m"
        echo -e "\e[33m=================================================================\e[0m"
#for palavra in $(cat /home/whacker/Documents/scripts/cyber.txt)
#do
#Encontrar_Arquivos $1 $2 
#1done
        while read palavra
        do
                Encontrar_Arquivos $1 $2
        #coloque aqui sua wordlist para os nomes dos arquivos
        done < cyber.txt
        echo -e "\e[33m=================================================================\e[0m"
fi
