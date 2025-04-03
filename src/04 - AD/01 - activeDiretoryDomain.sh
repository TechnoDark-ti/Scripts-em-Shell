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

sudo apt install -y autoconf bind9utils bison debhelper dnsutils \
                    docbook-xml docbook-xsl flex gdb libjansson-dev \
                    libacl1-dev libaio-dev libarchive-dev libattr1-dev \
                    libblkid-dev libbsd-dev libcap-dev libcups2-dev \
                    libgnutls28-dev libgpgme11-dev libjson-perl libldap2-dev \
                    libncurses5-dev libpam0g-dev libparse-yapp-perl libpopt-dev\
                    libreadline-dev nettle-dev perl perl-modules pkg-config\
                    python-all-dev python-crypto python-dbg python-dev\
                    python-dnspython python3-dnspython python-gpg python3-gpg\
                    python-markdown python3-markdown python3-dev xsltproc\
                    zlib1g-dev liblmdb-dev lmdb-utils libsystemd-dev

sudo reboot 

sudo apt install --y samba krb5-user winbind \
                    libnss-winbind smbclient \
                    ldap-utils acl attr ntp

sudo systemctl stop smbd.service &&  sudo systemctl stop nmbd.service

sudo systemctl stop winbind.service

cd /etc/samba

sudo mv smb.conf smb.conf.bkp

sudo samba-tool domain provision --use-rfc2307 --interactive

# Iniciar os serviços que foram parados anteriormente:

/etc/init.d/samba-ad-dc restart

# Ajustar os scripts para que os serviços inicializem corretamente

sudo systemctl unmask samba-ad-dc.service && sudo systemctl enable samba-ad-dc.service

sudo systemctl restart samba-ad-dc.service

# Verificar o status do serviço do Samba:

sudo systemctl status samba-ad-dc.service

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