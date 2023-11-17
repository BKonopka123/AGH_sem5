#include <iostream>
#include <fstream>
#include <cmath>
#include <vector>

#include "func.cpp"

void zad(std::fstream &file, double TOL, std::pair<double, double> (*f)(double, double, double, double));
std::pair<double, double> trapezoidal(double x_n, double v_n, double dt, double alpha);
std::pair<double, double> RK2(double x_n, double v_n, double dt, double alpha);
double control_step();
double f(double t, double x, double v, double alpha);
double g(double t, double x, double v, double alpha);

int main()
{
    std::fstream gfile;
	gfile.open("data.txt", std::ios::out);

    zad(gfile, 1e-2, trapezoidal);
    zad(gfile, 1e-5, trapezoidal);
    zad(gfile, 1e-2, RK2);
    zad(gfile, 1e-5, RK2);

    gfile.close();
    return 0;
}