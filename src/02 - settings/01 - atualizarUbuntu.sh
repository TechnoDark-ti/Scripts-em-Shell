# @Author: Márcio Moda
# Data: 01-04-2025
#
#
## O que esse código faz? ##
# # Ele atualiza o sistema operacional Ubuntu Server, incluindo pacotes, 
#dependências e removendo pacotes desnecessários.
########### FIM DOS COMENTÁROIOS ###########

#!/bin/bash

sudo apt update

sudo apt upgrade -y

sudo apt full-upgrade -y

sudo apt dist-upgrade -y

sudo apt autoremove -y

sudo apt autoclean -y

sudo apt clean