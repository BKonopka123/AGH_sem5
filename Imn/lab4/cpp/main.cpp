#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>

#include "func.cpp"

void relaksacja_globalna(std::fstream &file, double omega);
void relaksacja_lokalna(std::fstream &file, double omega);
double p(double x, double y);
void fill_p_tab();
double S(double V[150+1][100+1]);

int main()
{
    std::fstream gfile;
	gfile.open("data.txt", std::ios::out);

    fill_p_tab();
    relaksacja_globalna(gfile, 0.6);
    relaksacja_globalna(gfile, 1.0);
    relaksacja_lokalna(gfile, 1.0);
    relaksacja_lokalna(gfile, 1.4);
    relaksacja_lokalna(gfile, 1.8);
    relaksacja_lokalna(gfile, 1.9);

    gfile.close();
    return 0;
}