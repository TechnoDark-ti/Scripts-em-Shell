echo "deb https://www.deb-multimedia.org bookworm main non-free" > /etc/apt/sources.list.d/deb-multimedia.list
apt-get update -oAcquire::AllowInsecureRepositories=true
apt-get install deb-multimedia-keyring
apt-get update; apt-get dist-upgrade

