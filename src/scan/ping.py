""""
# @author: Márcio Moda
# this software is licensed GPL.v3
# software is a simple ping and port scanner
"""
from tqdm import tqdm
import subprocess, socket, os, time

def pingIntervalo(entrada_ip):
    result = subprocess.run(f"ping -c 3 {entrada_ip} ", shell=True)
    if result.returncode == 0:
        print("o ip fornecido não está respondendo")
    else:
        print("o ip fornecido está respondendo!")
    #result = subprocess.run(f"exit", shell=True)
    #print(result.stdout)   
def verificarPorta(entrada_ip, entrada_porta):
    entrada_porta = int(entrada_porta)
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.settimeout(1)
        result = s.connect_ex((entrada_ip, entrada_porta ))
        if result == 0:
            print(f"porta {entrada_porta} está aberta!")
        else:
            print(f"Porta {entrada_porta} está fechada!")    
while True:    
    try:
        os.system("clear")
        subprocess.run("figlet technodark", shell=True)

        print("""
        ### MENU ###
        1 - Pingar um IP
        2 - Verificar portas de um host
        0 - Sair
        """)

        opcao = input("Digite a opção: ")

        if opcao == '1':
            input_ip = input("Digite o IP para ping: ")
            for _ in tqdm(range(3)):
                time.sleep(0.5)
            pingIntervalo(input_ip)
            time.sleep(3)

        elif opcao == '2':
            input_ip = input("Digite o IP: ")
            input_port = input("Digite a porta: ")
            verificarPorta(input_ip, input_port)
            time.sleep(3)

        elif opcao == '0':
            print("\nSaindo...\n")
            break

        else:
            print("\nOpção inválida! Tente novamente.\n")
            time.sleep(2)

    except KeyboardInterrupt:
        print("\n\n Interrompido pelo usuário. Saindo...\n")
        break