#!/bash/bin

sudo apt update && sudo apt upgrade -y 

sudo apt install -y apache2 libapache2-mod-php \
                    php libapache2-mod-php

sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
