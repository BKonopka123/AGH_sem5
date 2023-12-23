#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>
#include <sstream>

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
    std::fstream g15file;
    std::fstream g16file;
    std::fstream g17file;
    std::fstream g18file;
    std::fstream g19file;

	g1file.open("plots/xgrid.txt", std::ios::out);
    g2file.open("plots/ygrid.txt", std::ios::out);
    g3file.open("plots/tgrid.txt", std::ios::out);

    g4file.open("plots/c_0.txt", std::ios::out);
    g5file.open("plots/c_01.txt", std::ios::out);

    g6file.open("plots/xsr_0.txt", std::ios::out);
    g7file.open("plots/xsr_01.txt", std::ios::out);
    
    g8file.open("plots/u_0_1.txt", std::ios::out);
    g9file.open("plots/u_0_2.txt", std::ios::out);
    g10file.open("plots/u_0_3.txt", std::ios::out);
    g11file.open("plots/u_0_4.txt", std::ios::out);
    g12file.open("plots/u_0_5.txt", std::ios::out);

    g13file.open("plots/u_1_1.txt", std::ios::out);
    g14file.open("plots/u_1_2.txt", std::ios::out);
    g15file.open("plots/u_1_3.txt", std::ios::out);
    g16file.open("plots/u_1_4.txt", std::ios::out);
    g17file.open("plots/u_1_5.txt", std::ios::out);

    g18file.open("plots/v_x.txt", std::ios::out);
    g19file.open("plots/v_y.txt", std::ios::out);

    create_grids(g1file, g2file);
    zad(g3file, g4file, g5file, g6file, g7file, g8file, g9file, g10file, g11file, g12file, g13file, g14file, g15file, g16file, g17file, g18file, g19file);

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
    g15file.close();
    g16file.close();
    g17file.close();
    g18file.close();
    g19file.close();

    return 0;
}