# @Author: Márcio Moda
# Data: 03-04-2025
#
#
## O que esse código faz? ##
# Ele instala o Samba 4 e configura um domínio Active Directory (AD) no Ubuntu Server ou Derivados.
# E também configura o DNS e o Kerberos, além de realizar testes de funcionamento do Samba 4.
########### FIM DOS COMENTÁROIOS ###########

#!/bin/bash

#samba-tools

sudo vim /etc/hosts
#alterar para essas configs de exemplo, ou modifique conforme a sua necessidade
#127.0.0.1       localhost.localdomain           localhost
#127.0.1.1       srv-ti01.infra.ti               srv-ti01
#192.168.18.10   srv-ti01.infra.ti               srv-ti01

sudo vim /etc/hostname

sudo apt install -y realmd sssd sssd-tools adcli samba-common-bin \
                    oddjob oddjob-mkhomedir packagekit

realm discover domain.local
sudo realm join --user=Administrador domain.local
realm list # Validar se o domínio foi adicionado corretamente
sudo pam-auth-update

#Habilite a opção:
#[✔] Create home directory on login

sudo realm permit --all


sudo reboot 

# Iniciar os serviços que foram parados anteriormente:

/etc/init.d/samba-ad-dc restart

# Abrir o arquivo “/etc/resolv.conf” e ajustar as configurações

#Desativar o serviço systemd-resolved: (para que não modifique
#automaticamente o arquivo “/etc/resolv.conf”)

systemctl disable systemd-resolved.service

systemctl stop systemd-resolved.service

sudo vim /etc/resolv.conf

# Copiar o arquivo “krb5.conf” do Samba 4 para o “/etc” e sobrescrever o existente:

sudo cp -vb /var/lib/samba/private/krb5.conf /etc/krb5.conf

sudo reboot

#Realização de testes e verificações de funcionamento do Samba 4:

#sudo smbclient -L localhost -U Administrator

#Verificar se o serviço de DNS está funcionando fazendo as resoluções:

#host -t A zer01ti.intra

#host -t SRV _ldap._tcp.zer01ti.intra

#host -t SRV _kerberos._udp.zer01ti.intra

#Verificar o funcionamento do KERBEROS:

#kinit administrator@ZER01TI.INTRA

#klist

sudo samba-tool domain level show