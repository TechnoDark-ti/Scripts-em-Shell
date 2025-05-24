# instalar e configurar os macbooks OS

#configurar o macbook
sudo --scutil --set ComputerName PC001.infra.local # set the computer name
sudo --scutil --set HostName PC001.infra.local # set the host name
sudo --scutil --set LocalHostName PC001 # set the local host name

#instalar alguns aplicativos como: Chrome, LibreOffice, Transmission, Unarchiver e VLC
curl -s 'https://api.macapps.link/pt/chrome-libreoffice-transmission-unarchiver-vlc' | sh

#instalar o brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install wine speedtest-cli wget nmap htop tree jq git python3 python3-pip 
