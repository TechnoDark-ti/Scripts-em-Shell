#!/bin/bash

HERE=$(cd "${0%/*}" && echo $PWD)
mkdir -p "$HOME/.config/user"

DEPENDENCIAS_I386_AMD64_MULTILIB_BASE_ARCH='mesa lib32-mesa faudio lib32-faudio libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins lib32-gst-plugins-base-libs gst-plugins-base-libs lib32-v4l-utils v4l-utils lib32-vkd3d vkd3d lib32-ocl-icd ocl-icd lib32-glu glu acl lib32-acl lib32-attr attr gettext lib32-gettext lib32-libnl libnl lib32-libpcap libcap lib32-sdl2_image sdl2_image lib32-sdl2_ttf sdl2_ttf lib32-sdl2_mixer sdl_mixer sdl2_net lib32-libidn11 libidn11 lib32-libva libva lib32-libxslt libxslt lib32-libxss libxss lib32-openal openal lib32-vulkan-intel vulkan-intel lib32-vulkan-radeon vulkan-radeon lib32-vulkan-validation-layers vulkan-validation-layers'

if 
     pacman -Qi $DEPENDENCIAS_I386_AMD64_MULTILIB_BASE_ARCH
then 
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"
elif 
     pacman -Qi $(LANGUAGE=en_US pacman -Siq wine | grep -i 'Depends' | cut -d: -f2 ; LANGUAGE=en_US pacman -Siq wine | grep -i 'Optional' -A $(LANGUAGE=en_US pacman -Siq wine | grep -i 'Optional' -A 1000 | grep -in -B2 'Conflicts' | grep -m1 '[0-9]' | cut -d '-' -f1) | grep -ivE '(cups|samba|dosbox|wine)' | cut -d ':' -f2 | tr -d ' ' | paste -d ' ' -s)
then
     echo 'GameLinux_Dependências_Instaladas' | tee "$HOME/.config/GameLinux/Dependências.cfg"          
fi

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
