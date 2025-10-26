#!/bin/bash

#====================================#
# Author: Márcio Moda
# Li
#
#
#=====================================#


# Parar o script em caso de erro
set -e

# Cores
VERDE='\033[1;32m'
AZUL='\033[1;34m'
VERMELHO='\033[1;31m'
RESET='\033[0m'

echo -e "${AZUL}========================================="
echo -e "  🧩 Configuração de Sistema para Jogos"
echo -e "=========================================${RESET}"

# Atualização do sistema
echo -e "${VERDE}🔧 Atualizando o sistema...${RESET}"
sudo apt update && sudo apt upgrade -y
pop-upgrade release update
pop-upgrade release update

# Habilitar arquitetura i386
echo -e "${VERDE}🏗️  Habilitando suporte a 32 bits (i386)...${RESET}"
sudo dpkg --add-architecture i386
sudo apt update

# Instalar drivers NVIDIA automaticamente (se aplicável)
if lspci | grep -E "NVIDIA|GeForce" > /dev/null; then
  echo -e "${VERDE}🟢 GPU NVIDIA detectada — instalando drivers proprietários...${RESET}"
  sudo apt install -y system76-driver-nvidia
else
  echo -e "${AZUL}🔵 GPU AMD/Intel detectada — pulando drivers NVIDIA.${RESET}"
fi

# Vulkan + Mesa + componentes gráficos
echo -e "${VERDE}🎮 Instalando Vulkan, Mesa e componentes essenciais...${RESET}"
sudo apt install -y \
  mesa-vulkan-drivers mesa-vulkan-drivers:i386 \
  libvulkan1 libvulkan1:i386 \
  vulkan-tools \
  gamemode libgamemode0 libgamemodeauto0 \
  mangohud

# Instalar ferramentas de jogos
echo -e "${VERDE}🕹️  Instalando Steam, Lutris e Heroic Games Launcher...${RESET}"
sudo apt install -y steam lutris

# Heroic Games Launcher (via Flatpak)
if ! command -v flatpak &> /dev/null; then
  echo -e "${VERDE}📦 Instalando Flatpak...${RESET}"
  sudo apt install -y flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

sudo flatpak install -y flathub com.heroicgameslauncher.hgl

# Instalar Wine + Winetricks
echo -e "${VERDE}🍷 Instalando Wine e Winetricks...${RESET}"
sudo apt install -y wine64 wine32 winetricks

# ProtonUp-Qt (para gerenciar versões do Proton)
sudo flatpak install -y flathub net.davidotek.pupgui2

# OBS Studio (streaming)
sudo apt install -y obs-studio

# Limpeza
echo -e "${VERDE}🧹 Limpando pacotes...${RESET}"
sudo apt autoremove -y
sudo apt autoclean -y

echo -e "${VERDE}✅ Configuração concluída com sucesso!${RESET}"
echo -e "${AZUL}Reinicie o sistema antes de começar a jogar.${RESET}"