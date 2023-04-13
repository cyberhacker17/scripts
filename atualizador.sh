!/bin/bash

# Precisa estar logado como root!

echo "deseja atualizar o sistema?: [sim/não]"
read resposta

if [[ $resposta == "sim" ]]; then
        echo "atualizando o sistema..."
        sudo apt-get update -y > log.txt
        sudo apt-get upgrade -y >> log.txt
        sudo apt-get autoremove -y >> log.txt
        echo "sistema atualizado com sucesso!"
elif [[ $resposta == "não" ]]; then
        echo "saindo do atualizador.."
else
        echo "Resposta invalida"
fi
