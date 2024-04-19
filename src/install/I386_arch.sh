#!/bin/bash

HERE=$(cd "${0%/*}" && echo $PWD)
mkdir -p "$HOME/.config/user"

DEPENDENCIAS_I386_AMD64_MULTILIB_BASE_ARCH='mesa lib32-mesa faudio lib32-faudio libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins lib32-gst-plugins-base-libs gst-plugins-base-libs lib32-v4l-utils v4l-utils lib32-vkd3d vkd3d lib32-ocl-icd ocl-icd lib32-glu glu acl lib32-acl lib32-attr attr gettext lib32-gettext lib32-libnl libnl lib32-libpcap libcap lib32-sdl2_image sdl2_image lib32-sdl2_ttf sdl2_ttf lib32-sdl2_mixer sdl_mixer sdl2_net lib32-libidn11 libidn11 lib32-libva libva lib32-libxslt libxslt lib32-libxss libxss lib32-openal openal lib32-vulkan-intel vulkan-intel lib32-vulkan-radeon vulkan-radeon lib32-vulkan-validation-layers vulkan-validation-layers'


TEXTO_BOAS_VINDAS='
                      🔵'$GAMENAME' Linux. 🔵

Sistema para instalar dependências de 32bits para jogos nativos de Linux e
jogos de windows 32bits que rodam através do wine e do proton.

Este Sistema busca dependências de 32bits no repositório da sua distro
e as instala usando o próprio gerenciador de pacores da distro.

Desta forma é possível ter dependências básicas de 32bits e 64bits 
como drivers de Áudio e Vídeo e seus respectivos codecs para o correto
funcionamento dos jogos 32bits ou i386,i686.

Note o Benefício. Se simplesmente instalar o wine terá consequentemente
suas respectivas dependências i386,i686 (32bits) porém terá o wine 
instalado na sua máquina podendo executar todo maldito arquivo.exe.
Este wine não é necessário para este projeto porque os AppImages 
já tem seu próprio wine dentro na versão necessária ou melhor 
versão para o jogo comsiderando a compatibilidade e a performance. 

Este sistema suporta: 

Debian 11, Ubuntu 18.04 LTS, Ubuntu 20.04 LTS, Ubuntu 22.04 LTS,
Ubuntu 23.04, ArchLinux com Repositório multilib habilitado e Manjaro.
Fedora 36 e 37 Workstation, OpenSUSE Tumbleweed.
Tentativa de suporte ao Fedora Silverblue (não recomendo.)
 
              🇧🇷 Inscreva-se Nos canais : 🇧🇷 GameLinux 🇧🇷

                 🔴 https://odysee.com/@gamelinux 🔴'

if 
     zenity --help >/dev/null
then   
     zenity --title='Bem vindo' --ok-label='Próximo' --info --ellipsize --text="$TEXTO_BOAS_VINDAS"
elif 
     yad --help >/dev/null
then     
     yad --center --title='Bem vindo' --button=Próximo:0 --info --text="$TEXTO_BOAS_VINDAS"
elif
     kdialog --help >/dev/null
then
     kdialog --ok-label='Próximo' --title='Boas vindas' --msgbox "$TEXTO_BOAS_VINDAS"
elif
     xmessage -help >/dev/null
then
     xmessage -geometry 600x500 -center -buttons OK:1 -bd blue -fg black -bg white -title "$GAMENAME" -print "$TEXTO_BOAS_VINDAS"
elif 
     "$HERE/usr/bin/yad" --help >/dev/null
then     
     "$HERE/usr/bin/yad" --center --title='Bem vindo' --button=Próximo:0 --info --text="$TEXTO_BOAS_VINDAS"
else
     echo 'zenity,yad e xmessage não foram encontrados junto com uma caralhada de pacotes nessa bosta de sistema.'
fi

####################################################################################
# Função para Mostrar uma barra de progresso quando estiver instalando dependências
####################################################################################

function function_graphics_barra_de_progresso_pulssante() {
if 
     zenity --help >/dev/null
then   
     zenity --display="$DISPLAY" --width=900 --height=100 --progress --pulsate --no-cancel --title='GameLinux Dependências' --text="<span size=\"xx-large\">$GAMELINUX_GRAPHICS_TEXT</span>\n\n <b></b>." --icon-name="$(cat "$HERE/"*.desktop | grep -w -m1 'Icon' | cut -d '=' -f2)" --window-icon="$HERE/"*.png --auto-close
elif 
     yad --help >/dev/null
then     
     yad --no-buttons --center --display="$DISPLAY" --width=900 --height=100 --progress --no-buttons --title='GameLinux Dependências' --text="<span size=\"xx-large\">$GAMELINUX_GRAPHICS_TEXT</span>\n\n <b></b>." --icon-name="$(cat "$HERE/"*.desktop | grep -w -m1 'Icon' | cut -d '=' -f2)" --window-icon="$HERE/"*.png --auto-close
elif
     kdialog --help >/dev/null
then
     kdialog --title='GameLinux Dependências' --progressbar="$GAMELINUX_GRAPHICS_TEXT" --icon="$(cat "$HERE/"*.desktop | grep -w -m1 'Icon' | cut -d '=' -f2)" ; sleep 5 ; killall kdialog_progres
elif
     xmessage -help >/dev/null
then
     xmessage -geometry 700x100 -center -timeout 3 -bd blue -fg black -bg white -title "$GAMELINUX_GRAPHICS_TEXT" -print "$GAMELINUX_GRAPHICS_TEXT"
elif 
     "$HERE/usr/bin/yad" --help >/dev/null
then     
     "$HERE/usr/bin/yad" --no-buttons --center --display="$DISPLAY" --width=900 --height=100 --progress --no-buttons --title='GameLinux Dependências' --text="<span size=\"xx-large\">$GAMELINUX_GRAPHICS_TEXT</span>\n\n <b></b>." --icon-name="$(cat "$HERE/"*.desktop | grep -w -m1 'Icon' | cut -d '=' -f2)" --window-icon="$HERE/"*.png --auto-close
else
     echo 'zenity,yad,kdialog e xmessage não foram encontrados nessa bosta de sistema.'
fi
}

############# Verificando se há dependências instaladas na base Arch
function_verificar_dependencias(){
if 
     pacman -Qi $DEPENDENCIAS_I386_AMD64_MULTILIB_BASE_ARCH
then 
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif 
     pacman -Qi $(LANGUAGE=en_US pacman -Siq wine | grep -i 'Depends' | cut -d: -f2 ; LANGUAGE=en_US pacman -Siq wine | grep -i 'Optional' -A $(LANGUAGE=en_US pacman -Siq wine | grep -i 'Optional' -A 1000 | grep -in -B2 'Conflicts' | grep -m1 '[0-9]' | cut -d '-' -f1) | grep -ivE '(cups|samba|dosbox|wine)' | cut -d ':' -f2 | tr -d ' ' | paste -d ' ' -s)
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"          
fi
}

function function_instalar_dependencias_i386_amd64_sistemas_base_arch() {
pkexec bash -c "
sudo pacman -Syu --noconfirm

sudo pacman -Sy --asdeps --needed --noconfirm $DEPENDENCIAS_I386_AMD64_MULTILIB_BASE_ARCH

sudo pacman -Sy --asdeps --needed --noconfirm $(LANGUAGE=en_US pacman -Siq wine | grep -i 'Depends' | cut -d: -f2 ; LANGUAGE=en_US pacman -Siq wine | grep -i 'Optional' -A $(LANGUAGE=en_US pacman -Siq wine | grep -i 'Optional' -A 1000 | grep -in -B2 'Conflicts' | grep -m1 '[0-9]' | cut -d '-' -f1) | grep -ivE '(cups|samba|dosbox|wine)' | cut -d ':' -f2 | tr -d ' ' | paste -d ' ' -s)

pacman -Qi zenity || sudo pacman -Sy --asdeps --needed --noconfirm zenity
pacman -Qi yad || sudo pacman -Sy --asdeps --needed --noconfirm yad
pacman -Qi fuse || sudo pacman -Sy --asdeps --needed --noconfirm fuse
pacman -Qi noto-fonts-emoji || sudo pacman -Sy --asdeps --needed --noconfirm noto-fonts-emoji

pacman -Qi lib32-faudio faudio || sudo pacman -Sy --asdeps --needed --noconfirm lib32-faudio faudio
pacman -Qi lib32-libpulse libpulse || sudo pacman -Sy --asdeps --needed --noconfirm lib32-libpulse libpulse
pacman -Qi lib32-alsa-plugins alsa-plugins || sudo pacman -Sy --asdeps --needed --noconfirm lib32-alsa-plugins alsa-plugins
pacman -Qi lib32-gst-plugins-base-libs gst-plugins-base-libs || sudo pacman -Sy --asdeps --needed --noconfirm lib32-gst-plugins-base-libs gst-plugins-base-libs
pacman -Qi lib32-v4l-utils v4l-utils || sudo pacman -Sy --asdeps --needed --noconfirm lib32-v4l-utils v4l-utils
pacman -Qi lib32-vkd3d vkd3d || sudo pacman -Sy --asdeps --needed --noconfirm lib32-vkd3d vkd3d
pacman -Qi lib32-ocl-icd ocl-icd || sudo pacman -Sy --asdeps --needed --noconfirm lib32-ocl-icd ocl-icd
pacman -Qi lib32-glu glu || sudo pacman -Sy --asdeps --needed --noconfirm lib32-glu glu
pacman -Qi lib32-acl acl || sudo pacman -Sy --asdeps --needed --noconfirm lib32-acl acl
pacman -Qi lib32-attr attr || sudo pacman -Sy --asdeps --needed --noconfirm lib32-attr attr
pacman -Qi lib32-gettext gettext || sudo pacman -Sy --asdeps --needed --noconfirm lib32-gettext gettext
pacman -Qi lib32-libnl libnl || sudo pacman -Sy --asdeps --needed --noconfirm lib32-libnl libnl
pacman -Qi lib32-libpcap libpcap || sudo pacman -Sy --asdeps --needed --noconfirm lib32-libpcap libpcap
pacman -Qi lib32-sdl2 sdl2 || sudo pacman -Sy --asdeps --needed --noconfirm lib32-sdl2 sdl2
pacman -Qi lib32-sdl2_ttf sdl2_ttf || sudo pacman -Sy --asdeps --needed --noconfirm lib32-sdl2_ttf sdl2_ttf
pacman -Qi lib32-sdl2_image sdl2_image || sudo pacman -Sy --asdeps --needed --noconfirm lib32-sdl2_image sdl2_image
pacman -Qi lib32-sdl2_mixer sdl_mixer || sudo pacman -Sy --asdeps --needed --noconfirm lib32-sdl2_mixer sdl_mixer
pacman -Qi sdl2_net || sudo pacman -Sy --asdeps --needed --noconfirm sdl2_net
pacman -Qi lib32-libidn11 libidn11 || sudo pacman -Sy --asdeps --needed --noconfirm lib32-libidn11 libidn11
pacman -Qi lib32-libva libva || sudo pacman -Sy --asdeps --needed --noconfirm lib32-libva libva
pacman -Qi lib32-libxslt libxslt || sudo pacman -Sy --asdeps --needed --noconfirm lib32-libxslt libxslt
pacman -Qi lib32-libxss libxss || sudo pacman -Sy --asdeps --needed --noconfirm libxss lib32-libxss
pacman -Qi lib32-openal openal || sudo pacman -Sy --asdeps --needed --noconfirm lib32-openal openal
pacman -Qi lib32-vulkan-intel vulkan-intel || sudo pacman -Sy --asdeps --needed --noconfirm lib32-vulkan-intel vulkan-intel
pacman -Qi lib32-vulkan-radeon vulkan-radeon || sudo pacman -Sy --asdeps --needed --noconfirm lib32-vulkan-radeon vulkan-radeon
pacman -Qi lib32-vulkan-validation-layers vulkan-validation-layers || sudo pacman -Sy --asdeps --needed --noconfirm lib32-vulkan-validation-layers vulkan-validation-layers
pacman -Qi lib32-vulkan-icd-loader vulkan-icd-loader || sudo pacman -Sy --asdeps --needed --noconfirm lib32-vulkan-icd-loader vulkan-icd-loader 
"
      function_verificar_dependencias | GAMELINUX_GRAPHICS_TEXT='Verificando Dependências' function_graphics_barra_de_progresso_pulssante
}


###########################################################################
#    Função para emitir uma mensagen de erro dependências não encontradas
###########################################################################

function function_graphics_dependencies_i386_not_found() {
TEXT_DEPENDENCIES_NOT_FOUND='
Erro: Dependências de 32Bits não encontradas.

Sobre: Um software i386,i686 ou 32bits depende de pacotes i386 Para funcionar.
O problema é que Distros Linux Amd64 ou 64bits geralmente só tem pacotes amd64.
Por Causa desse fato, Preciso instalar pacotes i386 para que funcione.
Uma vez instalados apartir do repositorio da distro, passam a integrar 
o sistema de modo passivo dando o suporte a aplicações i386,i686,32bits.

Dicas Relevantes: Se estiver em algum sistema com alguma base que não seja
as bases suportadas por este projeto você pode instalar algum software 
que demande as mesmas dependências so software dentro deste AppImage.
Exemplo Lutris ou o wine são softwares que instalam as mesmas dependências.
Se estes softwares estiverem instalados Consequentemente
suas depenências também estarão instaladas e o AppImage
poderá funcionar normalmente em distros não suportadas.'
if 
     zenity --help >/dev/null
then   
     zenity --display="$DISPLAY" --title='error' --ok-label='ok' --error --ellipsize --text="$TEXT_DEPENDENCIES_NOT_FOUND"
elif 
     yad --help >/dev/null
then     
     yad --center --display="$DISPLAY" --title='error' --button=Ok:0 --error --text="$TEXT_DEPENDENCIES_NOT_FOUND"
elif
     kdialog --help >/dev/null
then
     kdialog --ok-label 'ok' --error "$TEXT_DEPENDENCIES_NOT_FOUND"
elif 
     xmessage -help >/dev/null
then
     xmessage -geometry 800x300 -center -buttons Entendido:1 -bd blue -fg black -bg white -title GameLinux -print "$TEXT_DEPENDENCIES_NOT_FOUND"
elif
     x-terminal-emulator --help >/dev/null
then
     x-terminal-emulator -e sh -c "echo '$TEXT_DEPENDENCIES_NOT_FOUND' ; sleep 1000s"
elif 
     "$HERE/usr/bin/yad" --help >/dev/null
then     
     "$HERE/usr/bin/yad" --center --display="$DISPLAY" --title='error' --button=Ok:0 --error --text="$TEXT_DEPENDENCIES_NOT_FOUND"
else
     echo 'zenity,yad,kdialog e xmessage não foram encontrados junto com uma caralhada de pacotes nessa bosta de sistema.'
fi
   exit
}

###########################################################################
#  Função mensagen de erro dependências não encontradas_pergunta instalar
###########################################################################

function function_graphics_dependencies_i386_not_found_question() {
TEXT_DEPENDENCIES_NOT_FOUND_QUESTION='
Sobre: Um software i386,i686 ou 32bits depende de pacotes i386 Para funcionar.
O problema é que Distros Linux Amd64 ou 64bits geralmente só tem pacotes amd64.
Por Causa deste fato, Preciso instalar pacotes i386 para que funcione.
Uma vez instalados apartir do repositorio da distro, passam a integrar 
o sistema de modo passivo dando o suporte a aplicações i386,i686,32bits.

Pergunta : Deseja instalar os pacotes 32bits agora?'
if 
     zenity --help >/dev/null
then   
     zenity --display="$DISPLAY" --title='error' --ok-label='Instalar' --question --ellipsize --text="<span size=\"xx-large\">$TEXT_DEPENDENCIES_NOT_FOUND_QUESTION</span>\n\n <b></b>."
elif 
     yad --help >/dev/null
then     
     yad --center --display="$DISPLAY" --title='error' --button=Não:1 --button=Instalar:0 --question --text="$TEXT_DEPENDENCIES_NOT_FOUND_QUESTION"
elif 
     kdialog --help >/dev/null
then
     kdialog --title 'Falta Dependências' --yes-label 'Instalar' --no-label 'Não' --warningyesno "$TEXT_DEPENDENCIES_NOT_FOUND_QUESTION"
elif
     xmessage -help >/dev/null
then
     xmessage -geometry 800x300 -center -buttons Recusar:1,Instalar:0 -default Instalar -bd blue -fg black -bg white -title GameLinux -print "$TEXT_DEPENDENCIES_NOT_FOUND_QUESTION"
elif 
     "$HERE/usr/bin/yad" --help >/dev/null
then     
     "$HERE/usr/bin/yad" --center --display="$DISPLAY" --title='error' --button=Não:1 --button=Instalar:0 --question --text="$TEXT_DEPENDENCIES_NOT_FOUND_QUESTION"
else
     echo 'zenity,yad e xmessage não foram encontrados nessa bosta de sistema.'
fi



if
      cat '/etc/os-release' '/usr/lib/os-release' '/etc/lsb-release' '/usr/lib/lsb-release' | grep -wiE -m1 '(Regata OS|regataos)' && echo 'Bypass'
then
      echo 'ok' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif  
      pacman --help >/dev/null
then
      function_verificar_dependencias | GAMELINUX_GRAPHICS_TEXT='Verificando Dependências' function_graphics_barra_de_progresso_pulssante
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_graphics_dependencies_i386_not_found_question || exit 
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_instalar_dependencias_i386_amd64_sistemas_base_arch | GAMELINUX_GRAPHICS_TEXT='Atualizando o Repositório e instalando Dependências/pacotes 32bits' function_graphics_barra_de_progresso_pulssante
elif  
      pacman --help >/dev/null
then
      function_verificar_dependencias | GAMELINUX_GRAPHICS_TEXT='Verificando Dependências' function_graphics_barra_de_progresso_pulssante
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_graphics_dependencies_i386_not_found_question || exit 
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_instalar_dependencias_i386_amd64_sistemas_base_arch | GAMELINUX_GRAPHICS_TEXT='Atualizando o Repositório e instalando Dependências/pacotes 32bits' function_graphics_barra_de_progresso_pulssante
else
      echo 'Erro!' ; function_graphics_dependencies_i386_not_found
fi
   cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_graphics_dependencies_i386_not_found
