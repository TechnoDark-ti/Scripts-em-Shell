#!/bin/bash 

#Serviço de acesso remoto via vnc para qualquer sistema operacional
#
#@Author: Márcio Moda 

###############################################################
#
#
#  ATENÇÃO! PARA DISTROS BASEADAS NO UBUNTU 24.04 ESTÁ QUEBRADA
#
#
##############################################################


#instalação do serviço vnc server
sudo apt install tigervnc-standalone-server

#configurar o passwd sem o sudo
vncpasswd

#Configurar o arquivo vnc para usar o xfce
cd ~/.vnc
touch xstartup
echo "#!/bin/bash \ unset SESSION_MANAGER \ unset DBUS_SESSION_MANAGER \ exec startxfce4" > xstartup

#Permitir que ele seja um executável
chmod u+x ~/.vnc/xstartup

#instalar um servidor ssh (opicional)
sudo apt install openssh-server


