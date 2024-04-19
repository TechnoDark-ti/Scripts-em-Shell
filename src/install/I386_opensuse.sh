#!/bin/bash
HERE=$(cd "${0%/*}" && echo $PWD)
mkdir -p "$HOME/.config/user"

GAMENAME='i386 Install'
RESOLUTION=$(cat /sys/class/drm/*/modes | head -n1)
GAMEPREFIX="$HOME/.config/user/$GAMENAME"


DEPENDENCY_OPENSUSE_TUMBLEWEED='glibc-32bit gstreamer-32bit gstreamer-plugins-base-32bit gstreamer-plugins-good-jack-32bit alsa-plugins-pulse-32bit gstreamer-plugins-libav-32bit gstreamer-plugins-ugly-32bit libFAudio0-32bit Mesa-libGL1-32bit libpulse0-32bit libOSMesa8-32bit libvulkan_radeon-32bit libOpenCL1-32bit Mesa-libEGL1-32bit libvulkan1-32bit libcapi20-3-32bit libXcomposite1-32bit libgstvulkan-1_0-0-32bit libvkd3d1-32bit libXcursor1-32bit libXi6-32bit libXinerama1-32bit libXpm4-32bit libXxf86vm1-32bit libv4l2-0-32bit libtevent0-32bit libtiff5-32bit libldap2-32bit libv4lconvert0-32bit libwayland-egl1-32bit libXrandr2-32bit libtdb1-32bit libpcap1-32bit libsane1-32bit libgphoto2-6-32bit libgphoto2_port12-32bit libacl1-32bit libaudit1-32bit libcrack2-32bit libcrypt1-32bit libnscd1-32bit libpopt0-32bit alsa-plugins-jack-32bit libavahi-client3-32bit libjansson4-32bit libjbig2-32bit libavahi-common3-32bit libavif15-32bit libeconf0-32bit libexif12-32bit libldb2-32bit libvulkan_intel-32bit libtalloc2-32bit gstreamer gstreamer-plugins-base gstreamer-plugins-libav gstreamer-plugins-ugly gstreamer-plugins-good-jack gstreamer-plugin-pipewire alsa-plugins-oss gstreamer-plugins-vaapi libslirp0 debianutils libFAudio0 Mesa-libEGL1 libwayland-egl1 Mesa-libGL1 libpulse0 alsa-plugins libOSMesa8 libOpenCL1 libcapi20-3 libvulkan1 libXxf86vm1 libvulkan_radeon libvulkan_intel libvkd3d1 libgstvulkan-1_0-0 libldap2 libXcomposite1 libXcursor1 libXi6 libXinerama1 libXpm4 libXrandr2 libSDL2_net-2_0-0 libtalloc2 libv4l2-0 libv4lconvert0 libsane1 libspeexdsp1 libtdb1 libtevent0 libtiff5 libjansson4 libjbig2 libldb2 libopusfile0 libpcap1 libavahi-client3 libavahi-common3 libavif15 libeconf0 libexif12 libgphoto2-6 libgphoto2_port12 alsa-plugins-jack alsa-plugins-pulse'

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
     if zypper --help >/dev/null;then if LANGUAGE=en_US zypper --quiet info $DEPENDENCY_OPENSUSE_TUMBLEWEED | grep -vwE '(Information|-|Repository|Name|Version|Arch|Vendor|Status|Source|Upstream|Summary|Description|automatically|Size)' | grep -w 'Installed' | cut -d: -f2 | sort -u | grep -wi 'No' ; then false; else true; fi ; else false ; fi
then     
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg" 
elif     
     rpm -qa | grep mesa-dri-drivers | grep i686 && rpm -qa | grep openldap | grep i686 && rpm -qa | grep ocl-icd | grep i686 && rpm -qa | grep pulseaudio-libs | grep i686 && rpm -qa | grep alsa-lib | grep i686 && rpm -qa | grep ncurses-libs | grep i686 && rpm -qa | grep libX11 | grep i686 && rpm -qa | grep libXrandr | grep i686 && rpm -qa | grep mesa-vulkan-drivers | grep i686 && rpm -qa | grep vulkan-loader | grep i686 && rpm -qa | grep mesa-libGL | grep i686 && rpm -qa | grep gvfs | grep i686 && rpm -qa | grep SDL2 | grep i686 && rpm -qa | grep SDL_ttf | grep i686 && rpm -qa | grep SDL_net | grep i686 && rpm -qa | grep SDL_sound | grep i686 && rpm -qa | grep SDL_image | grep i686 && rpm -qa | grep SDL_Pango | grep i686 && rpm -qa | grep libwayland-egl | grep i686 && rpm -qa | grep libXcomposite | grep i686 && rpm -qa | grep libXdamage | grep i686 && rpm -qa | grep libjpeg-turbo | grep i686 && rpm -qa | grep libpng | grep i686 && rpm -qa | grep zlib | grep i686 && rpm -qa | grep krb5-libs | grep i686 && rpm -qa | grep nss | grep i686 && rpm -qa | grep libFAudio | grep i686 && rpm -qa | grep pipewire | grep i686 && rpm -qa | grep pipewire-libs | grep i686 && rpm -qa | grep openssl-libs | grep i686 && rpm -qa | grep mesa-libOSMesa | grep i686 && rpm -qa | grep mesa-libglapi | grep i686
then 
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
else 
     clear && echo 'Dependencias não encontradas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
fi


function function_install_dependency_32bit_64bit_opensuse_tumbleweed() {
pkexec bash -c "
sudo zypper --non-interactive --quiet refresh >/dev/null
sudo zypper --non-interactive --quiet install --recommends zenity >/dev/null
sudo zypper --non-interactive --quiet install --recommends yad >/dev/null
sudo zypper --non-interactive --quiet install --recommends $DEPENDENCY_OPENSUSE_TUMBLEWEED >/dev/null
"
  function_verificar_dependencias | GAMELINUX_GRAPHICS_TEXT='Verificando Dependências Instaladas' function_graphics_barra_de_progresso_pulssante
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
}

if
      cat '/etc/os-release' '/usr/lib/os-release' '/etc/lsb-release' '/usr/lib/lsb-release' | grep -wiE -m1 '(Regata OS|regataos)' && echo 'Bypass'
then
      echo 'ok' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif  
      zypper --help >/dev/null
then
      function_verificar_dependencias | GAMELINUX_GRAPHICS_TEXT='Verificando Dependências' function_graphics_barra_de_progresso_pulssante
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_graphics_dependencies_i386_not_found_question || exit 
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_install_dependency_32bit_64bit_opensuse_tumbleweed | GAMELINUX_GRAPHICS_TEXT='Atualizando o Repositório e instalando Dependências/pacotes 32bits' function_graphics_barra_de_progresso_pulssante
