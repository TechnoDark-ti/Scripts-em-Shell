# @Author: Márcio Moda
# Data: 01-04-2025
#
#
## O que esse código faz? ##
# Ele configura o hostname do servidor Ubuntu Server e altera as configurações de rede, 
#incluindo o endereço IP, gateway e servidores DNS.
########### FIM DOS COMENTÁROIOS ###########

# Configurando o hostname do servidor Ubuntu Server
# ir para o etc/etc/hostname
sudo vim /etc/hostname

#insert
infra.ti

#salvar e sair
:wq

#altarando entradas no arquivos Hosts
sudo vim /etc/hosts

#insert
127.0.0.1      srv-ti01   localhost 
127.0.1.1      infra.ti   infra.ti 
REDE_IPV4      infra.ti   infra.ti

#salvar e sair
:wq

#instalar pacotes de rede do servidor

sudo apt install -y net-tools bridge-utils dnsutils iputils-ping ifenslave

# verificar configs de hardware de rede
sudo lspci -v | grep -i ethernet

#verificar os detalhes do hardware da placa de rede
sudo lshw  -class network

#verificando address IPV4
sudo ifconfig -a
sudo ip address show

#verificando o gateway
sudo route -n
sudo ip route

#verificando as informações de cache dos Servidores DNS (resolução de nomes)
sudo resolvectl

#Alterando as configurações da Placa de Rede do Ubuntu Server
ls -lh /etc/netplan

#backup de precaução das configs
sudo cp -v /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.bkp

sudo vim /etc/netplan/50-cloud-init.yaml

#insert

network:
    ethernets:
      enp0s3:
        dhcp4: false
        dhcp6: false
        addresses: [192.168.0.2/24] #substituir pelo IP do servidor
        gateway4: 192.168.0.1 #substituir pelo IP do gateway
        nameservers:
          addresses: [192.168.0.20, 192.168.10.21] #substituir pelos IPs dos servidores DNS ou pelo google 8.8.8.8 u 8.8.1.1
          search: infra.ti
version: 2
#salvar e sair
:wq


# aplicando as configurações do Netplan em modo debug

sudo netplan --debub apply

#caso de falhas, use esse comando aqui para testar
sudo netplan --debug try

#validar essas novas configs
sudo ifconfig
sudo ip address show

sudo resolvectl

sudo hostname
sudo hostname -A
sudo hostname -d
sudo hostname -i