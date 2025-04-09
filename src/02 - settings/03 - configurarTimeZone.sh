# @Author: Márcio Moda
# Data: 01-04-2025
#
#
## O que esse código faz? ##
# Ele configura a data e hora do hostname
########### FIM DOS COMENTÁROIOS ###########

#!/bin/bash

# Configura o fuso horário para Óbidos-

#verificando as informações detalhas de localidade do sistema
sudo localectl


#verificando as informações de localidades instaladas no sistema 
#opção do comando locale: -a (all-locales)
sudo locale -a


#gerando a localidade do Português do Brasil
sudo locale-gen pt_BR.UTF-8

#configurando a localidade Português do Brasil
#opção do comando localectl: set-locale (Set the system locale)
sudo localectl set-locale LANG=pt_BR.UTF-8

#atualizando as localidades do Português do Brasil e Linguagem do Sistema
sudo update-locale LANG=pt_BR.UTF-8 LC_ALL=pt_BR.UTF-8 LANGUAGE="pt_BR:pt:en"

#recomendado rebootar o sistema para testar as localidades
sudo reboot

#verificando as mudanças de localidades do sistema
#opção do comando locale: -a (all-locales)
sudo localectl
sudo locale -a

#verificando as informações de fuso horário do sistema
sudo timedatectl

#configurando o fuso horário de America São Paulo
#opção do comando timedatectl: set-timezone (set the system time zone to the specified value)
sudo timedatectl set-timezone "America/Santarém"

#verificando as mudanças do Timezone
sudo timedatectl

#O NTP é um protocolo para sincronização dos relógios dos computadores baseado no 
#protocolo UDP sob a porta 123. É utilizado para sincronização do relógio de um 
#conjunto de computadores e dispositivos em redes de dados com latência variável.

#editando o arquivo de configuração timesyncd.conf
sudo vim /etc/systemd/timesyncd.conf
