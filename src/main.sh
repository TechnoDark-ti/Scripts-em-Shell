#!bin/bash
cat <<EOF
____   ____ ____  ___ ____ _____ ____    ____  _   _ _____ _     _     
/ ___| / ___|  _ \|_ _|  _ \_   _/ ___|  / ___|| | | | ____| |   | |    
\___ \| |   | |_) || || |_) || | \___ \  \___ \| |_| |  _| | |   | |    
 ___) | |___|  _ < | ||  __/ | |  ___) |  ___) |  _  | |___| |___| |___ 
|____/ \____|_| \_\___|_|    |_| |____/  |____/|_| |_|_____|_____|_____|

EOF
#Contanto até 5 para apresentar a logo do Script

echo "\nBem vindo ao menu de configuração em shell"
echo "Sistemas suportados:"
echo "1 - Baseados em Debian"
echo "2 - Baseados em Arch"
echo "Em desenvolvimento/teste:"
echo "3 -Baseados em Fedora"
echo "4 - Baseados em OpenSUSE"
echo "\5 - Sair"

#opção
#lread -p "Escolha uma opção:"