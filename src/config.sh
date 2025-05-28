echo "deb https://www.deb-multimedia.org bookworm main non-free" > /etc/apt/sources.list.d/deb-multimedia.list
apt update -oAcquire::AllowInsecureRepositories=true
apt install deb-multimedia-keyring
apt update && apt dist-upgrade

