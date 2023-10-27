#include <iostream>
#include <fstream>
#include <cmath>
#include "/usr/include/gsl/gsl_math.h"
#include "/usr/include/gsl/gsl_linalg.h"
#include "/usr/include/gsl/gsl_deriv.h"

#include "func.cpp"

void zad1(std::fstream &gfile, std::fstream &wfile);
void zad2(std::fstream &gfile, std::fstream &wfile);

void zad1_1(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali);
void zad1_2(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali);
void zad1_3(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali);
void zad2_1(std::fstream &gfile, std::fstream &wfile);

double euler(double y_n, double dt, double lambda);
double rk2(double y_n, double dt, double lambda);
double rk4(double y_n, double dt, double lambda);
double rk4_q(double q_n, double i_n, double dt, double t, double R, double L, double C, double w_v);
double rk4_i(double q_n, double i_n, double dt, double t, double R, double L, double C, double w_v);

int main()
{
    std::fstream gfile;
    std::fstream wfile;
	gfile.open("data.txt", std::ios::out );
    wfile.open("data_written.txt", std::ios::out );

    zad1(gfile, wfile);
    zad2(gfile, wfile);

    gfile.close();
    wfile.close();
    return 0;
}