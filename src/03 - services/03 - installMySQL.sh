#!/bash/bin/

sudo apt install -y default-mysql-server default-mysql-client || {
    echo "O seu sistema não suporta o MySQL. Instalando a MariaDB"
    sudo apt install -y mariadb-server mariadb-client || {
        echo "Erro ao instalar o MySQL ou MariaDB"
        exit 1
    }
    exit 1
}