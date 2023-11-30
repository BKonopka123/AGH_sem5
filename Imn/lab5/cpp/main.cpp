#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>

#include "func.cpp"

void zad(std::fstream &file);
double calc_vb1(int j);
double calc_vb2(int i);
double calc_vb3(int j);
double calc_vb4(int i);
double calc_S(double V[128+1][128+1], int ks);

int main()
{
    std::fstream gfile;
	gfile.open("data.txt", std::ios::out);

    zad(gfile);

    gfile.close();
    return 0;
}