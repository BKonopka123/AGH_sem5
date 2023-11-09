#include <iostream>
#include <fstream>
#include <cmath>
#include "/usr/include/gsl/gsl_math.h"
#include "/usr/include/gsl/gsl_linalg.h"
#include "/usr/include/gsl/gsl_deriv.h"

#include "func.cpp"

void zad1(std::fstream &file);
void zad2(std::fstream &file);
void zad3(std::fstream &file);

int main()
{
    std::fstream gfile;
	gfile.open("data.txt");

    zad1(gfile);
    zad2(gfile);
    zad3(gfile);

    gfile.close();
    return 0;
}