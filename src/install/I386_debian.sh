#!/bin/bash
HERE=$(cd "${0%/*}" && echo $PWD)
mkdir -p "$HOME/.config/user"


GAMENAME='i386 Install'
RESOLUTION=$(cat /sys/class/drm/*/modes | head -n1)
GAMEPREFIX="$HOME/.config/user/$GAMENAME"

DEPENDENCIAS_DEBIAN_11='sed:amd64 x11-utils:amd64 libvulkan-dev:amd64 libc6:i386 libpulse0:amd64 libpulse0:i386 libsdl2-gfx-1.0-0:i386 libsdl2-image-2.0-0:i386 libsdl2-ttf-2.0-0:i386 libxcb-xf86dri0:i386 libxdamage1:i386 libgssapi-krb5-2:i386 libegl1-mesa:i386 libgles2-mesa:i386 libglu1-mesa:i386 libglapi-mesa:i386 libgl1:i386 libgl1-mesa-dri:i386 libglx-mesa0:i386 libwayland-egl1-mesa:i386 mesa-vulkan-drivers:i386 mesa-vulkan-drivers:amd64 libxext6:i386 libgl1-mesa-glx:i386 libcanberra-pulse:i386 libx11-6:i386 libjack-jackd2-0:i386 libvisual-0.4-0:i386 libglib2.0-0:i386 libgphoto2-6:i386 libasound2-plugins:i386 liblcms2-2:i386 libmpg123-0:i386 libopenal1:i386 libpcap0.8:i386 libfontconfig1:i386 libosmesa6:amd64 libosmesa6:i386 libxcomposite1:i386 libasn1-8-heimdal:i386 libavahi-client3:i386 libavahi-common-data:i386 libexif12:i386 libheimntlm0-heimdal:i386 libhx509-5-heimdal:i386 libieee1284-3:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-26-heimdal:i386 libkrb5support0:i386 libsasl2-2:i386 libsasl2-modules:i386 libsasl2-modules-db:i386 libsqlite3-0:i386 libusb-1.0-0:i386 libv4lconvert0:i386 libwind0-heimdal:i386 libxpm4:i386 libunwind8:i386 libxml2:i386 libcapi20-3:amd64 libcapi20-3:i386 libcups2:i386 libodbc1:i386 libsane1:i386 libv4l-0:i386 libxslt1.1:i386 libxtst6:i386 mesa-vdpau-drivers:i386 libjpeg62-turbo:i386 libjpeg62-turbo:amd64 libva2:i386 libspeex1:i386 libva-drm2:i386 libpangocairo-1.0-0:i386 gstreamer1.0-alsa:amd64 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gl:i386 libgstreamer-gl1.0-0:i386 gstreamer1.0-plugins-ugly:amd64 gstreamer1.0-plugins-ugly:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-plugins-bad:amd64 gstreamer1.0-plugins-bad:i386 gstreamer1.0-libav:amd64 gstreamer1.0-libav:i386 libgstreamer-plugins-base1.0-0:i386 libfaudio0:amd64 libfaudio0:i386 libncurses5:i386 libncursesw5:i386 libncurses6:i386 libncursesw6:i386 libvkd3d1:amd64 libvkd3d1:i386 libldap-2.4-2:i386 libldap-2.4-2:amd64 libssl1.1:i386 libssl1.1:amd64 ocl-icd-libopencl1:amd64 ocl-icd-libopencl1:i386 libodbc1:i386 libodbc1:amd64 libwebp6:i386 libz-mingw-w64:amd64 libidn11:i386 libidn11:amd64 libva-wayland2:amd64 libva-wayland2:i386'

DEPENDENCIAS_UBUNTU_18_04_LTS='sed:amd64 x11-utils:amd64 libvulkan-dev:amd64 libc6:i386 libsdl2-2.0-0:i386 libsdl2-2.0-0:amd64 gstreamer1.0-libav:i386 gstreamer1.0-gl:i386 libgstreamer-gl1.0-0:i386 gstreamer1.0-gl:amd64 libgstreamer-gl1.0-0:amd64 libasound2-plugins:i386 libpulse0:amd64 libpulse0:i386 libsdl2-gfx-1.0-0:i386 libsdl2-image-2.0-0:i386 libsdl2-ttf-2.0-0:i386 libxcb-xf86dri0:i386 libxdamage1:i386 libgssapi-krb5-2:i386 libegl1-mesa:i386 libgles2-mesa:i386 libglu1-mesa:i386 libglapi-mesa:i386 libgl1:i386 libgl1-mesa-dri:i386 libglx-mesa0:i386 libwayland-egl1-mesa:i386 mesa-vulkan-drivers:i386 mesa-vulkan-drivers:amd64 libxext6:i386 libgl1-mesa-glx:i386 libcanberra-pulse:i386 libx11-6:i386 libjack-jackd2-0:i386 libvisual-0.4-0:i386 libglib2.0-0:i386 libgphoto2-6:i386 liblcms2-2:i386 libmpg123-0:i386 libopenal1:i386 libpcap0.8:i386 libfontconfig1:i386 libosmesa6:amd64 libosmesa6:i386 libxcomposite1:i386 libasn1-8-heimdal:i386 libavahi-client3:i386 libavahi-common-data:i386 libexif12:i386 libheimntlm0-heimdal:i386 libhx509-5-heimdal:i386 libieee1284-3:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-26-heimdal:i386 libkrb5support0:i386 libsasl2-2:i386 libsasl2-modules:i386 libsasl2-modules-db:i386 libsqlite3-0:i386 libusb-1.0-0:i386 libv4lconvert0:i386 libwind0-heimdal:i386 libxpm4:i386 libunwind8:i386 libxml2:i386 libcapi20-3:amd64 libcapi20-3:i386 libcups2:i386 libodbc1:i386 libodbc1:amd64 libsane1:i386 libv4l-0:i386 libxslt1.1:i386 libxtst6:i386 mesa-vdpau-drivers:i386 libjpeg62:i386 libva2:i386 libspeex1:i386 libva-drm2:i386 libpangocairo-1.0-0:i386 gstreamer1.0-alsa:amd64 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gl:i386 libgstreamer-gl1.0-0:i386 gstreamer1.0-plugins-ugly:amd64 gstreamer1.0-plugins-ugly:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-libav:amd64 libgstreamer-plugins-base1.0-0:i386 libidn11:i386 libidn11:amd64 libldap-2.4-2:i386 libldap-2.4-2:amd64 libncurses5:i386 libncursesw5:i386 libssl1.1:i386 libssl1.1:amd64 libwebp6:i386 libva-wayland2:amd64 libva-wayland2:i386'

DEPENDENCIAS_UBUNTU_20_04_LTS='sed:amd64 x11-utils:amd64 libvulkan-dev:amd64 libc6:i386 libpulse0:amd64 libpulse0:i386 libsdl2-gfx-1.0-0:i386 libsdl2-image-2.0-0:i386 libsdl2-ttf-2.0-0:i386 libxcb-xf86dri0:i386 libxdamage1:i386 libgssapi-krb5-2:i386 libegl1-mesa:i386 libgles2-mesa:i386 libglu1-mesa:i386 libglapi-mesa:i386 libgl1:i386 libgl1-mesa-dri:i386 libglx-mesa0:i386 libwayland-egl1-mesa:i386 mesa-vulkan-drivers:i386 mesa-vulkan-drivers:amd64 libxext6:i386 libgl1-mesa-glx:i386 libcanberra-pulse:i386 libx11-6:i386 libjack-jackd2-0:i386 libvisual-0.4-0:i386 libglib2.0-0:i386 libgphoto2-6:i386 libasound2-plugins:i386 liblcms2-2:i386 libmpg123-0:i386 libopenal1:i386 libpcap0.8:i386 libfontconfig1:i386 libosmesa6:amd64 libosmesa6:i386 libxcomposite1:i386 libasn1-8-heimdal:i386 libavahi-client3:i386 libavahi-common-data:i386 libexif12:i386 libheimntlm0-heimdal:i386 libhx509-5-heimdal:i386 libieee1284-3:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-26-heimdal:i386 libkrb5support0:i386 libsasl2-2:i386 libsasl2-modules:i386 libsasl2-modules-db:i386 libsqlite3-0:i386 libusb-1.0-0:i386 libv4lconvert0:i386 libwind0-heimdal:i386 libxpm4:i386 libunwind8:i386 libxml2:i386 libcapi20-3:amd64 libcapi20-3:i386 libcups2:i386 libodbc1:i386 libsane1:i386 libv4l-0:i386 libxslt1.1:i386 libxtst6:i386 mesa-vdpau-drivers:i386 libjpeg62:i386 libva2:i386 libspeex1:i386 libva-drm2:i386 libpangocairo-1.0-0:i386 gstreamer1.0-alsa:amd64 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gl:i386 libgstreamer-gl1.0-0:i386 gstreamer1.0-plugins-ugly:amd64 gstreamer1.0-plugins-ugly:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-plugins-bad:amd64 gstreamer1.0-plugins-bad:i386 gstreamer1.0-libav:amd64 gstreamer1.0-libav:i386 libgstreamer-plugins-base1.0-0:i386 libfaudio0:amd64 libfaudio0:i386 libncurses5:i386 libncursesw5:i386 libncurses6:i386 libncursesw6:i386 libvkd3d1:amd64 libvkd3d1:i386 libldap-2.4-2:i386 libldap-2.4-2:amd64 libssl1.1:i386 libssl1.1:amd64 ocl-icd-libopencl1:amd64 ocl-icd-libopencl1:i386 libodbc1:i386 libodbc1:amd64 libwebp6:i386 libz-mingw-w64:amd64 libidn11:i386 libidn11:amd64 libva-wayland2:amd64 libva-wayland2:i386'

DEPENDENCIAS_UBUNTU_22_04_LTS='sed:amd64 x11-utils:amd64 libvulkan-dev:amd64 libc6:i386 libpulse0:amd64 libpulse0:i386 libsdl2-gfx-1.0-0:i386 libsdl2-image-2.0-0:i386 libsdl2-ttf-2.0-0:i386 libxcb-xf86dri0:i386 libxdamage1:i386 libgssapi-krb5-2:i386 libegl1-mesa:i386 libgles2-mesa:i386 libglu1-mesa:i386 libglapi-mesa:i386 libgl1:i386 libgl1-mesa-dri:i386 libglx-mesa0:i386 libwayland-egl1-mesa:i386 mesa-vulkan-drivers:i386 mesa-vulkan-drivers:amd64 libxext6:i386 libgl1-mesa-glx:i386 libcanberra-pulse:i386 libx11-6:i386 libjack-jackd2-0:i386 libvisual-0.4-0:i386 libglib2.0-0:i386 libgphoto2-6:i386 libasound2-plugins:i386 liblcms2-2:i386 libmpg123-0:i386 libopenal1:i386 libpcap0.8:i386 libfontconfig1:i386 libosmesa6:amd64 libosmesa6:i386 libxcomposite1:i386 libasn1-8-heimdal:i386 libavahi-client3:i386 libavahi-common-data:i386 libexif12:i386 libheimntlm0-heimdal:i386 libhx509-5-heimdal:i386 libieee1284-3:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-26-heimdal:i386 libkrb5support0:i386 libsasl2-2:i386 libsasl2-modules:i386 libsasl2-modules-db:i386 libsqlite3-0:i386 libusb-1.0-0:i386 libv4lconvert0:i386 libwind0-heimdal:i386 libxpm4:i386 libunwind8:i386 libxml2:i386 libcapi20-3:amd64 libcapi20-3:i386 libcups2:i386 libodbc1:i386 libsane1:i386 libv4l-0:i386 libxslt1.1:i386 libxtst6:i386 mesa-vdpau-drivers:i386 libjpeg62:i386 libva2:i386 libspeex1:i386 libva-drm2:i386 libpangocairo-1.0-0:i386 gstreamer1.0-alsa:amd64 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gl:i386 libgstreamer-gl1.0-0:i386 gstreamer1.0-plugins-ugly:amd64 gstreamer1.0-plugins-ugly:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-plugins-bad:amd64 gstreamer1.0-plugins-bad:i386 gstreamer1.0-libav:amd64 gstreamer1.0-libav:i386 libgstreamer-plugins-base1.0-0:i386 libfaudio0:amd64 libfaudio0:i386 gstreamer1.0-pipewire:amd64 gstreamer1.0-pipewire:i386 libncurses6:i386 libncursesw6:i386 libvkd3d1:amd64 libvkd3d1:i386 libldap-2.5-0:amd64 libldap-2.5-0:i386 libssl3:amd64 libssl3:i386 libldap-2.5-0:amd64 libldap-2.5-0:i386 ocl-icd-libopencl1:amd64 ocl-icd-libopencl1:i386 libodbc2:amd64 libodbc2:i386 libwebp7:i386 libz-mingw-w64:amd64 libva-wayland2:amd64 libva-wayland2:i386'

DEPENDENCIAS_UBUNTU_23_04='sed:amd64 x11-utils:amd64 libvulkan-dev:amd64 libc6:i386 libpulse0:amd64 libpulse0:i386 libsdl2-gfx-1.0-0:i386 libsdl2-image-2.0-0:i386 libsdl2-ttf-2.0-0:i386 libxcb-xf86dri0:i386 libxdamage1:i386 libgssapi-krb5-2:i386 libegl1-mesa:i386 libgles2-mesa:i386 libglu1-mesa:i386 libglapi-mesa:i386 libgl1:i386 libgl1-mesa-dri:i386 libglx-mesa0:i386 libwayland-egl1-mesa:i386 mesa-vulkan-drivers:i386 mesa-vulkan-drivers:amd64 libxext6:i386 libgl1-mesa-glx:i386 libcanberra-pulse:i386 libx11-6:i386 libjack-jackd2-0:i386 libvisual-0.4-0:i386 libglib2.0-0:i386 libgphoto2-6:i386 libasound2-plugins:i386 liblcms2-2:i386 libmpg123-0:i386 libopenal1:i386 libpcap0.8:i386 libfontconfig1:i386 libosmesa6:amd64 libosmesa6:i386 libxcomposite1:i386 libasn1-8-heimdal:i386 libavahi-client3:i386 libavahi-common-data:i386 libexif12:i386 libheimntlm0-heimdal:i386 libhx509-5-heimdal:i386 libieee1284-3:i386 libk5crypto3:i386 libkeyutils1:i386 libkrb5-26-heimdal:i386 libkrb5support0:i386 libsasl2-2:i386 libsasl2-modules:i386 libsasl2-modules-db:i386 libsqlite3-0:i386 libusb-1.0-0:i386 libv4lconvert0:i386 libwind0-heimdal:i386 libxpm4:i386 libunwind8:i386 libxml2:i386 libcapi20-3:amd64 libcapi20-3:i386 libcups2:i386 libodbc1:i386 libsane1:i386 libv4l-0:i386 libxslt1.1:i386 libxtst6:i386 mesa-vdpau-drivers:i386 libjpeg62:i386 libva2:i386 libspeex1:i386 libva-drm2:i386 libpangocairo-1.0-0:i386 gstreamer1.0-alsa:amd64 gstreamer1.0-pulseaudio:i386 gstreamer1.0-gl:i386 libgstreamer-gl1.0-0:i386 gstreamer1.0-plugins-ugly:amd64 gstreamer1.0-plugins-ugly:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-plugins-bad:amd64 gstreamer1.0-plugins-bad:i386 gstreamer1.0-libav:amd64 gstreamer1.0-libav:i386 libgstreamer-plugins-base1.0-0:i386 libfaudio0:amd64 gstreamer1.0-pipewire:amd64 gstreamer1.0-pipewire:i386 libncurses6:i386 libncursesw6:i386 libvkd3d1:amd64 libldap2:amd64 libldap2:i386 libssl3:amd64 libssl3:i386 ocl-icd-libopencl1:amd64 ocl-icd-libopencl1:i386 libodbc2:amd64 libodbc2:i386 libwebp7:i386 libz-mingw-w64:amd64 libva-wayland2:amd64 libva-wayland2:i386'

DEPENDENCIAS_UBUNTU_GENERAL='libvkd3d1:amd64 libfontconfig1:i386 libfreetype6:i386 libasound2:i386 libglib2.0-0:i386 libgphoto2-6:i386 libgphoto2-port12:i386 libgstreamer-plugins-base1.0-0:i386 libgstreamer1.0-0:i386 liblcms2-2:i386 libmpg123-0:i386 libopenal1:i386 libpcap0.8:i386 libpulse0:i386 libudev1:i386 libx11-6:i386 libxext6:i386 libxml2:i386 ocl-icd-libopencl1:i386 libz-mingw-w64:amd64 libcapi20-3:i386 libcups2:i386 libdbus-1-3:i386 libgl1:i386 libgnutls30:i386 libgsm1:i386 libgssapi-krb5-2:i386 libjpeg8:i386 libkrb5-3:i386 libodbc1:i386 libosmesa6:i386 libpng16-16:i386 libsdl2-2.0-0:i386 libtiff5:i386 libv4l-0:i386 libxcomposite1:i386 libxcursor1:i386 libxfixes3:i386 libxi6:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxslt1.1:i386 libxxf86vm1:i386 libgl1-mesa-dri:i386 libasound2-plugins:i386 gstreamer1.0-plugins-good:i386 gstreamer1.0-libav:i386 gstreamer1.0-plugins-bad:i386 gstreamer1.0-plugins-bad:amd64 gstreamer1.0-plugins-ugly:i386 gstreamer1.0-plugins-ugly:amd64 libva-wayland2:amd64 libva-wayland2:i386 mesa-vdpau-drivers:amd64 mesa-vdpau-drivers:i386 vdpau-driver-all:amd64 vdpau-driver-all:i386 libasound2-plugins:amd64 libasound2-plugins:i386 libcapi20-3:amd64 libcapi20-3:i386 libosmesa6:i386 libosmesa6:amd64 libsdl2-2.0-0:amd64 libsdl2-2.0-0:i386 tdsodbc:amd64 tdsodbc:i386 gstreamer1.0-libav:amd64 gstreamer1.0-libav:i386'


###############  Início do  Bloco de funções  #############################

TEXTO_BOAS_VINDAS='
                      '$GAMENAME' Linux.

Olá e seja bem-vindo ao nosso sistema de instalação de dependências de 32 bits para jogos nativos de Linux e jogos Windows de 32 bits que rodam através do Wine e do Proton.

Nosso sistema busca as dependências de 32 bits necessárias diretamente no repositório da sua distribuição Linux e as instala utilizando o gerenciador de pacotes padrão da sua distro.

Com isso, você poderá garantir a presença das dependências básicas tanto de 32 bits quanto de 64 bits, como drivers de áudio e vídeo, juntamente com seus respectivos codecs, essenciais para o funcionamento adequado dos jogos 32 bits ou i386/i686.

É importante ressaltar o benefício desse sistema. Ao instalar simplesmente o Wine, você obterá automaticamente as dependências i386/i686 (32 bits), porém o Wine será instalado em sua máquina, permitindo a execução de qualquer arquivo .exe. No entanto, para este projeto, o Wine não é necessário, pois os AppImages já incluem sua própria versão do Wine na medida certa ou até mesmo otimizada para o jogo, levando em consideração a compatibilidade e o desempenho.

Nosso sistema é compatível com as seguintes distribuições:
- Debian 11
- Ubuntu 18.04 LTS
- Ubuntu 20.04 LTS
- Ubuntu 22.04 LTS
- Ubuntu 23.04
- ArchLinux com repositório multilib habilitado
- Manjaro
- Fedora 36 e 37 Workstation
- OpenSUSE Tumbleweed

Estamos trabalhando para oferecer suporte ao Fedora Silverblue, embora neste momento não o recomendemos completamente devido a possíveis limitações.

Esperamos que nosso sistema facilite a instalação e o uso dos seus jogos favoritos em Linux.'
         
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

####################################################################################
# Função que emite os comandos para instalar uma lista de dependências pré-escrita
####################################################################################

function function_instalar_dependencias_i386_amd64_sistemas_base_ubuntu_debian() {
pkexec bash -c "
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y zenity
sudo apt install -y yad
sudo apt install -y $DEPENDENCIAS_DEBIAN_11
sudo apt install -y $DEPENDENCIAS_UBUNTU_GENERAL
sudo apt install -y $DEPENDENCIAS_UBUNTU_23_04
sudo apt install -y $DEPENDENCIAS_UBUNTU_22_04_LTS
sudo apt install -y $DEPENDENCIAS_UBUNTU_20_04_LTS
sudo apt install -y $DEPENDENCIAS_UBUNTU_18_04_LTS

sudo apt install -y $(LANGUAGE=en_US apt-cache depends ffmpeg:amd64 ffmpeg:i386 | grep -iE '(Depends:|Recommends:)' | tr '|' ' ' | tr ' ' '\n' | grep -viE '(<|fonts|nvidia|libnvidia|Depends:|Recommends:)' | tr '\n' ' ')

sudo apt install -y $(LANGUAGE=en_US apt-cache depends ffmpeg:i386 | grep -iE '(Depends:|Recommends:)' | tr '|' ' ' | tr ' ' '\n' | grep -viE '(<|fonts|nvidia|libnvidia|Depends:|Recommends:)' | tr '\n' ' ')

sudo apt install -y $(LANGUAGE=en_US apt-cache depends libwine libwine:i386 | grep -iE '(Depends:|Recommends:|Suggests:)' | tr '|' ' ' | tr ' ' '\n' | grep -viE '(<|wine|exe-thumbnailer|dosbox|playonlinux|lutris|winbind|kio-extras|fonts|nvidia|libnvidia|cups-bsd|preloader|Depends:|Recommends:|Suggests:)' | tr '\n' ' ')

sudo apt install -y $(LANGUAGE=en_US apt-cache depends libwine:i386 | grep -iE '(Depends:|Recommends:|Suggests:)' | tr '|' ' ' | tr ' ' '\n' | grep -viE '(<|wine|exe-thumbnailer|dosbox|playonlinux|lutris|winbind|kio-extras|fonts|nvidia|libnvidia|cups-bsd|preloader|Depends:|Recommends:|Suggests:)' | tr '\n' ' ')

if  nvidia-smi -L; then sudo apt install -y libnvidia-*"$(nvidia-smi -q | grep -w 'Driver Version' | cut -d ':' -f 2 | cut -d '.' -f 1 | tr ' ' '-')":i386; fi

"
    function_verificar_dependencias | GAMELINUX_GRAPHICS_TEXT='Verificando Dependências' function_graphics_barra_de_progresso_pulssante
}



####################################################################################
# Função que Verifica se as dependencias necessárias estão instaladas 
####################################################################################

function function_verificar_dependencias() {
if 
     dpkg -V $DEPENDENCIAS_DEBIAN_11
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif
     dpkg -V $DEPENDENCIAS_UBUNTU_23_04
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif
     dpkg -V $DEPENDENCIAS_UBUNTU_22_04_LTS
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif 
     dpkg -V $DEPENDENCIAS_UBUNTU_20_04_LTS
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif 
     dpkg -V $DEPENDENCIAS_UBUNTU_18_04_LTS
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif 
     dpkg -V $DEPENDENCIAS_UBUNTU_GENERAL
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif 
     LANGUAGE=en_US apt-cache depends libwine libwine:i386 || exit
     dpkg -V $(LANGUAGE=en_US apt-cache depends libwine libwine:i386 | grep -iE '(Depends:|Recommends:|Suggests:)' | tr '|' ' ' | tr ' ' '\n' | grep -viE '(<|wine|exe-thumbnailer|dosbox|playonlinux|lutris|winbind|kio-extras|fonts|nvidia|libnvidia|cups-bsd|preloader|Depends:|Recommends:|Suggests:)' | tr '\n' ' ') || dpkg -V $(LANGUAGE=en_US apt-cache depends libwine:i386 | grep -iE '(Depends:|Recommends:|Suggests:)' | tr '|' ' ' | tr ' ' '\n' | grep -viE '(<|wine|exe-thumbnailer|dosbox|playonlinux|lutris|winbind|kio-extras|fonts|nvidia|libnvidia|cups-bsd|preloader|Depends:|Recommends:|Suggests:)' | tr '\n' ' ')
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
}


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
      wine --help >/dev/null && wine64 --help >/dev/null
then
      echo 'wine encontrado'
elif
      echo $Arquitetura_do_windows | grep 'win64'
then
      echo 'Software/game 64bits'      
else
     
#----------------------------------------------------------------------------------------------------------------------------------
if
      cat '/etc/os-release' '/usr/lib/os-release' '/etc/lsb-release' '/usr/lib/lsb-release' | grep -wiE -m1 '(Regata OS|regataos)' && echo 'Bypass'
then
      echo 'ok' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif
      dpkg --help >/dev/null
then
      function_verificar_dependencias | GAMELINUX_GRAPHICS_TEXT='Verificando Dependências' function_graphics_barra_de_progresso_pulssante
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_graphics_dependencies_i386_not_found_question || exit 
      cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_instalar_dependencias_i386_amd64_sistemas_base_ubuntu_debian | GAMELINUX_GRAPHICS_TEXT='Atualizando o Repositório e instalando Dependências/pacotes 32bits' function_graphics_barra_de_progresso_pulssante

else
      echo 'Deu 💩' ; function_graphics_dependencies_i386_not_found
fi
   cat "$HOME/.config/GameLinux/Dependências.cfg" | grep -wE '(GameLinux_Dependências_Instaladas|ok)' || function_graphics_dependencies_i386_not_found
#----------------------------------------------------------------------------------------------------------------------------------
fi