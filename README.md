# SCRIPTS EM SHELL
 Este repositório é voltado para os scripts em shell para configuração e automação de configurações do ambiente desktop linux. Visando rodar programas nativos do Windos sob uma API de tradução para Linux


# Como funciona?
Basicamente são diretórios onde contem configurações para diversos sistemas operacioanis baseados no Linux, como Debian. A finalidade é usar um programa do Windows para Linux através do Wine para traduzir os programas Windows (nativos) para Linux (debian).

Note que na pasta 'src' contem os código fonte dos scripts em shellscript com várias seções, como config, install, etc

Cada uma desses diretórios são propriamente deduzivos, ou seja, o próprio nome se refere a finaldiade deles.

configs - Diretório para configurar o ambiente do programa e os demais parâmetros de configuração

install - Diretório para instalar os programas e libs que estiverem faltando na distribuição


# Rodar
Para rodar esse programa, execute no terminal bash cada um dessas aplicações, basicamente eles estão conectados para rodaram em conjunto. O principal programa estará fora desses diretórios e será chamado de 'main'