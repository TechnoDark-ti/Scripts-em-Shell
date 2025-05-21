/*
@Author: Márcio Moda
GPL V.3
-- Calculador de Subredes --
*/
#include <iostream>
#include <vector>
#include <bitset>
#include <cmath>
#include <sstream>

using namespace std;

uint32_t ipToInt(const string& ipStr) {
    uint32_t ip = 0;
    int a, b, c, d;
    sscanf(ipStr.c_str(), "%d.%d.%d.%d", &a, &b, &c, &d);
    ip |= (a << 24);
    ip |= (b << 16);
    ip |= (c << 8);
    ip |= d;
    return ip;
}

string intToIp(uint32_t ip) {
    return to_string((ip >> 24) & 0xFF) + "." +
           to_string((ip >> 16) & 0xFF) + "." +
           to_string((ip >> 8) & 0xFF) + "." +
           to_string(ip & 0xFF);
}

int main() {
    string ipStr;
    int prefixo;

    cout << "Digite o endereço IP (ex: 192.168.1.10): ";
    cin >> ipStr;

    cout << "Digite o prefixo CIDR (ex: 24): ";
    cin >> prefixo;

    if (prefixo < 0 || prefixo > 32) {
        cout << "Prefixo inválido. Deve estar entre 0 e 32.\n";
        return 1;
    }

    uint32_t ip = ipToInt(ipStr);
    uint32_t mask = (prefixo == 0) ? 0 : 0xFFFFFFFF << (32 - prefixo);

    uint32_t network = ip & mask;
    uint32_t broadcast = network | ~mask;

    uint32_t firstHost = (prefixo < 31) ? network + 1 : network;
    uint32_t lastHost = (prefixo < 31) ? broadcast - 1 : broadcast;

    uint32_t totalHosts = (prefixo < 31) ? (1 << (32 - prefixo)) - 2 : (1 << (32 - prefixo));

    cout << "\n--- Resultado do Cálculo de Subrede ---" << endl;
    cout << "Endereço IP:       " << ipStr << endl;
    cout << "Máscara de subrede: " << intToIp(mask) << endl;
    cout << "Endereço de rede:   " << intToIp(network) << endl;
    cout << "Endereço de broadcast: " << intToIp(broadcast) << endl;
    cout << "Primeiro IP válido: " << intToIp(firstHost) << endl;
    cout << "Último IP válido:   " << intToIp(lastHost) << endl;
    cout << "Total de IPs válidos: " << totalHosts << endl;
    return 0;
}
