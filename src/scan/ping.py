""""
# @author: Márcio Moda
# this software is licensed GPL.v3
# software is a simple ping and port scanner
"""
from tqdm import tqdm
import subprocess, socket, os, time

while True:
    def pingIntervalo(entrada_ip):
        result = subprocess.run(f"ping {entrada_ip} -c 3", shell=True)
        #result = subprocess.run(f"exit", shell=True)
        #print(result.stdout)   
    def verificarPorta(entrada_porta, entrada_ip):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(1)
            result = s.connect_ex((entrada_ip, entrada_porta ))
            if result == 0:
                print(f"porta {entrada_porta} está aberta!")
            else:
                print(f"Porta {entrada_porta} está fechada!")    
    subprocess.run(f" figlet technodark", shell=True)
    #subprocess.run(f" ifconfig | grep inet", shell=True)
    print("""
        ### MENU ###
        1 - Pingar um intervalo de IP
        2 - Verificar portas de um host
        0 - Sair
    """)
    opcao = input("Digite a opção: ")
    os.system('clear') or None

    if opcao == '1':
        input_ip = input("Digite a faixa IP: ")
        for i in tqdm(range(3)):
            time.sleep(0.5)
        pingIntervalo(input_ip)
        time.sleep(3)
        os.system('clear') or None

    elif opcao == '2':
        input_ip = input("Digite o IP: ")
        input_port = input("Digite a porta: ")
        verificarPorta(input_ip, input_port)
    elif opcao == '0':
        break
    else:
        print("Opção inválida")