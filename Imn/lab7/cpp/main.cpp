#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>

#include "func.cpp"

int main()
{
    std::fstream g1file;
    std::fstream g2file;
    std::fstream g3file;
    std::fstream g4file;
    std::fstream g5file;
    std::fstream g6file;
    std::fstream g7file;
    std::fstream g8file;
    std::fstream g9file;
    std::fstream g10file;
    std::fstream g11file;
    std::fstream g12file;
    std::fstream g13file;
    std::fstream g14file;

	g1file.open("plots/xgrid.txt", std::ios::out);
    g2file.open("plots/ygrid.txt", std::ios::out);

    g3file.open("plots/psi_-4000.txt", std::ios::out);
    g4file.open("plots/psi_-1000.txt", std::ios::out);
    g5file.open("plots/psi_4000.txt", std::ios::out);

    g6file.open("plots/u_-4000.txt", std::ios::out);
    g7file.open("plots/u_-1000.txt", std::ios::out);
    g8file.open("plots/u_4000.txt", std::ios::out);

    g9file.open("plots/v_-4000.txt", std::ios::out);
    g10file.open("plots/v_-1000.txt", std::ios::out);
    g11file.open("plots/v_4000.txt", std::ios::out);

    g12file.open("plots/zeta_-4000.txt", std::ios::out);
    g13file.open("plots/zeta_-1000.txt", std::ios::out);
    g14file.open("plots/zeta_4000.txt", std::ios::out);

    for(int i=0; i<=200; ++i){
        g1file << x(i) << std::endl;
    }

    for(int j=0; j<=90; ++j){
        g2file << y(j) << std::endl;
    }

    zad(g6file, g9file, g3file, g12file, -4000);
    zad(g7file, g10file, g4file, g13file, -1000);
    zad(g8file, g11file, g5file, g14file, 4000);

    g1file.close();
    g2file.close();
    g3file.close();
    g4file.close();
    g5file.close();
    g6file.close();
    g7file.close();
    g8file.close();
    g9file.close();
    g10file.close();
    g11file.close();
    g12file.close();
    g13file.close();
    g14file.close();

    return 0;
}