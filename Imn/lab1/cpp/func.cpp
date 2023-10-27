#include <iostream>
#include <fstream>
#include <cmath>
#include "/usr/include/gsl/gsl_math.h"
#include "/usr/include/gsl/gsl_linalg.h"
#include "/usr/include/gsl/gsl_deriv.h"

// Subpoints pre-declaration
void zad1_1(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali);
void zad1_2(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali);
void zad1_3(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali);
void zad2_1(std::fstream &gfile, std::fstream &wfile, double dt, double R, double L, double C, double w_v, double T_0, double q_zero, double i_zero, gsl_vector *t, gsl_vector *q, gsl_vector *i);

//extra functions pre-declaration
double euler(double y_n, double dt, double lambda);
double rk2(double y_n, double dt, double lambda);
double rk4(double y_n, double dt, double lambda);
double rk4_q(double q_n, double i_n, double dt, double t, double R, double L, double C, double w_v);
double rk4_i(double q_n, double i_n, double dt, double t, double R, double L, double C, double w_v);

//**************************************************************ZAD1
void zad1(std::fstream &gfile, std::fstream &wfile)
{
    
    //*************************************

    //needed variables
    double lambda = -1.0;
    double y_zero = 1.0;
    int n_1 = 5.0/1.0 + 1;
    int n_2 = 5.0/0.1 + 1;
    int n_3 = 5.0/0.01 + 1;

    //initialization of vector t and y for dt=1.0
    gsl_vector *t_fi = gsl_vector_calloc(n_1);
    for(int i=0; i<n_1; i++)
    {
        gsl_vector_set(t_fi, i, i);
        gfile << gsl_vector_get(t_fi, i) << " ";
    }
    gfile << std::endl;
    gsl_vector *y_fi = gsl_vector_calloc(n_1);
    gsl_vector_set(y_fi, 0, y_zero);

    //initialization of vector t and y for dt=0.1
    gsl_vector *t_se = gsl_vector_calloc(n_2);
    for(int i=0; i<n_2; i++)
    {
        gsl_vector_set(t_se, i, i*0.1);
        gfile << gsl_vector_get(t_se, i) << " ";
    }
    gfile << std::endl;
    gsl_vector *y_se = gsl_vector_calloc(n_2);
    gsl_vector_set(y_se, 0, y_zero);

    //initialization of vector t and y for dt=0.01
    gsl_vector *t_th = gsl_vector_calloc(n_3);
    for(int i=0; i<n_3; i++)
    {
        gsl_vector_set(t_th, i, i*0.01);
        gfile << gsl_vector_get(t_th, i) << " ";
    }
    gfile << std::endl;
    gsl_vector *y_th = gsl_vector_calloc(n_3);
    gsl_vector_set(y_th, 0, y_zero);

    //initialization of vector t and y for analytical solution
    gsl_vector *t_anali = gsl_vector_calloc(n_3);
    for(int i=0; i<n_3; i++)
    {
        gsl_vector_set(t_anali, i, i*0.01);
        gfile << gsl_vector_get(t_th, i) << " ";
    }
    gfile << std::endl;
    gsl_vector *y_anali = gsl_vector_calloc(n_3);
    gsl_vector_set(y_anali, 0, y_zero);
    
    //calling subpoint 1
    zad1_1(gfile, wfile, lambda, y_zero, n_1, n_2, n_3, t_fi, y_fi, t_se, y_se, t_th, y_th, t_anali, y_anali);

    //*************************************

    //calling subpoint 2
    zad1_2(gfile, wfile, lambda, y_zero, n_1, n_2, n_3, t_fi, y_fi, t_se, y_se, t_th, y_th, t_anali, y_anali);

    //*************************************

    //calling subpoint 3
    zad1_3(gfile, wfile, lambda, y_zero, n_1, n_2, n_3, t_fi, y_fi, t_se, y_se, t_th, y_th, t_anali, y_anali);

    //*************************************
    gsl_vector_free(t_fi);
    gsl_vector_free(y_fi);
    gsl_vector_free(t_se);
    gsl_vector_free(y_se);
    gsl_vector_free(t_th);
    gsl_vector_free(y_th);
    gsl_vector_free(t_anali);
    gsl_vector_free(y_anali);
}

//**************************************************************ZAD2
void zad2(std::fstream &gfile, std::fstream &wfile)
{
    //needed variables
    double dt = 0.0001;
    double R = 100.0;
    double L = 0.1;
    double C = 0.001;
    double w_0 = 1.0/sqrt(L*C);
    double T_0 = 2*M_PI/w_0;
    double q_zero = 0.0;
    double i_zero = 0.0;

    //initialization of vector t, q and i
    gsl_vector *t = gsl_vector_calloc(4*T_0/dt + 1);
    for(int i=0; i<4*T_0/dt; i++)
    {
        gsl_vector_set(t, i, i*dt);
        gfile << gsl_vector_get(t, i) << " ";
    }
    gfile << std::endl;

    gsl_vector *q = gsl_vector_calloc(4*T_0/dt + 1);
    gsl_vector_set(q, 0, q_zero);

    gsl_vector *i = gsl_vector_calloc(4*T_0/dt + 1);
    gsl_vector_set(i, 0, i_zero);

    //calling subpoint 1
    zad2_1(gfile, wfile, dt, R, L, C, w_0*0.5, T_0, q_zero, i_zero, t, q, i);
    zad2_1(gfile, wfile, dt, R, L, C, w_0*0.8, T_0, q_zero, i_zero, t, q, i);
    zad2_1(gfile, wfile, dt, R, L, C, w_0*1.0, T_0, q_zero, i_zero, t, q, i);
    zad2_1(gfile, wfile, dt, R, L, C, w_0*1.2, T_0, q_zero, i_zero, t, q, i);

    //deleting vectors
    gsl_vector_free(t);
    gsl_vector_free(q);
    gsl_vector_free(i);
}



//**************************************************************ZAD1_1
void zad1_1(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali)
{
    gfile << std::fixed;
    
    wfile << "*************************ZAD1_1_A*************************" << std::endl;

    //getting results of Euler method and writing them to file - dt=1.0
    gfile << y_zero << " ";
    wfile << "dt=1.0" << std::endl;
    for(int i=1; i<n_1; i++)
    {
        gsl_vector_set(y_fi, i, euler(gsl_vector_get(y_fi, i-1), 1.0, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_fi, i) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(y_fi, i) << std::endl;
        gfile << gsl_vector_get(y_fi, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting results of Euler method and writing them to file - dt=0.1
    gfile << y_zero << " ";
    wfile << "dt=0.1" << std::endl;
    for(int i=1; i<n_2; i++)
    {
        gsl_vector_set(y_se, i, euler(gsl_vector_get(y_se, i-1), 0.1, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_se, i) << " " ;
        wfile.width(20);
        wfile << gsl_vector_get(y_se, i) << std::endl;
        gfile << gsl_vector_get(y_se, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting results of Euler method and writing them to file - dt=0.01
    gfile << y_zero << " ";
    wfile << "dt=0.01" << std::endl;
    for(int i=1; i<n_3; i++)
    {
        gsl_vector_set(y_th, i, euler(gsl_vector_get(y_th, i-1), 0.01, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_th, i) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(y_th, i) << std::endl;
        gfile << gsl_vector_get(y_th, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting results of analytical method and writing them to file
    gfile << y_zero << " ";
    wfile << "analytical" << std::endl;
    for(int i=1; i<n_3; i++)
    {
        gsl_vector_set(y_anali, i, pow(M_E, lambda*gsl_vector_get(t_anali, i)));
        wfile.width(20);
        wfile << gsl_vector_get(t_anali, i) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(y_anali, i) << std::endl;
        gfile << gsl_vector_get(y_anali, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;  

    wfile << "*************************ZAD1_1_B*************************" << std::endl; 

    gsl_vector *global_error_fi = gsl_vector_calloc(n_1);
    gsl_vector *global_error_se = gsl_vector_calloc(n_2);
    gsl_vector *global_error_th = gsl_vector_calloc(n_3);

    //getting global error for dt=1.0 and writing it to file
    wfile << "y(t) - y_anali for dt=1.0" << std::endl;
    for(int i=0; i<n_1; i++)
    {
        gsl_vector_set(global_error_fi, i, gsl_vector_get(y_fi, i) - gsl_vector_get(y_anali, i/0.01));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_fi, i) << std::endl;
        gfile << gsl_vector_get(global_error_fi, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting global error for dt=0.1 and writing it to file
    wfile << "y(t) - y_anali for dt=0.1" << std::endl;
    for(int i=0; i<n_2; i++)
    {
        gsl_vector_set(global_error_se, i, gsl_vector_get(y_se, i) - gsl_vector_get(y_anali, i/0.1));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_se, i) << std::endl;
        gfile << gsl_vector_get(global_error_se, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting global error for dt=0.01 and writing it to file
    wfile << "y(t) - y_anali for dt=0.01" << std::endl;
    for(int i=0; i<n_3; i++)
    {
        gsl_vector_set(global_error_th, i, gsl_vector_get(y_th, i) - gsl_vector_get(y_anali, i/1.0));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_th, i) << std::endl;
        //if(gsl_vector_get(global_error_th, i) < 0.0001 && gsl_vector_get(global_error_th, i) > -0.0001)
        //    gfile << 0 << " ";
        //else
            gfile << gsl_vector_get(global_error_th, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    gsl_vector_free(global_error_fi);
    gsl_vector_free(global_error_se);
    gsl_vector_free(global_error_th);
}

//**************************************************************ZAD1_2
void zad1_2(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali)
{
    gfile << std::fixed;
    
    wfile << "*************************ZAD1_2_A*************************" << std::endl;

    //getting results of RK2 method and writing them to file - dt=1.0
    gfile << y_zero << " ";
    wfile << "dt=1.0" << std::endl;
    for(int i=1; i<n_1; i++)
    {
        gsl_vector_set(y_fi, i, rk2(gsl_vector_get(y_fi, i-1), 1.0, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_fi, i) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(y_fi, i) << std::endl;
        gfile << gsl_vector_get(y_fi, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting results of RK2 method and writing them to file - dt=0.1
    gfile << y_zero << " ";
    wfile << "dt=0.1" << std::endl;
    for(int i=1; i<n_2; i++)
    {
        gsl_vector_set(y_se, i, rk2(gsl_vector_get(y_se, i-1), 0.1, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_se, i) << " " ;
        wfile.width(20);
        wfile << gsl_vector_get(y_se, i) << std::endl;
        gfile << gsl_vector_get(y_se, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting results of RK2 method and writing them to file - dt=0.01
    gfile << y_zero << " ";
    wfile << "dt=0.01" << std::endl;
    for(int i=1; i<n_3; i++)
    {
        gsl_vector_set(y_th, i, rk2(gsl_vector_get(y_th, i-1), 0.01, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_th, i) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(y_th, i) << std::endl;
        gfile << gsl_vector_get(y_th, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    wfile << "*************************ZAD1_2_B*************************" << std::endl;

    gsl_vector *global_error_fi = gsl_vector_calloc(n_1);
    gsl_vector *global_error_se = gsl_vector_calloc(n_2);
    gsl_vector *global_error_th = gsl_vector_calloc(n_3);

    //getting global error for dt=1.0 and writing it to file
    wfile << "y(t) - y_anali for dt=1.0" << std::endl;
    for(int i=0; i<n_1; i++)
    {
        gsl_vector_set(global_error_fi, i, gsl_vector_get(y_fi, i) - gsl_vector_get(y_anali, i/0.01));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_fi, i) << std::endl;
        gfile << gsl_vector_get(global_error_fi, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting global error for dt=0.1 and writing it to file
    wfile << "y(t) - y_anali for dt=0.1" << std::endl;
    for(int i=0; i<n_2; i++)
    {
        gsl_vector_set(global_error_se, i, gsl_vector_get(y_se, i) - gsl_vector_get(y_anali, i/0.1));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_se, i) << std::endl;
        //if(gsl_vector_get(global_error_se, i) < 0.0001 && gsl_vector_get(global_error_se, i) > -0.0001)
        //    gfile << 0 << " ";
        //else
            gfile << gsl_vector_get(global_error_se, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting global error for dt=0.01 and writing it to file
    wfile << "y(t) - y_anali for dt=0.01" << std::endl;
    for(int i=0; i<n_3; i++)
    {
        gsl_vector_set(global_error_th, i, gsl_vector_get(y_th, i) - gsl_vector_get(y_anali, i/1.0));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_th, i) << std::endl;
        //if(gsl_vector_get(global_error_th, i) < 0.0001 && gsl_vector_get(global_error_th, i) > -0.0001)
        //    gfile << 0 << " ";
        //else
            gfile << gsl_vector_get(global_error_th, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    gsl_vector_free(global_error_fi);
    gsl_vector_free(global_error_se);
    gsl_vector_free(global_error_th);
}

//**************************************************************ZAD1_3
void zad1_3(std::fstream &gfile, std::fstream &wfile, double lambda, double y_zero, int n_1, int n_2, int n_3, gsl_vector *t_fi, gsl_vector *y_fi, gsl_vector *t_se, gsl_vector *y_se, gsl_vector *t_th, gsl_vector *y_th, gsl_vector *t_anali, gsl_vector *y_anali)
{
    gfile << std::fixed;
    
    wfile << "*************************ZAD1_3_A*************************" << std::endl;

    //getting results of RK4 method and writing them to file - dt=1.0
    gfile << y_zero << " ";
    wfile << "dt=1.0" << std::endl;
    for(int i=1; i<n_1; i++)
    {
        gsl_vector_set(y_fi, i, rk4(gsl_vector_get(y_fi, i-1), 1.0, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_fi, i) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(y_fi, i) << std::endl;
        gfile << gsl_vector_get(y_fi, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting results of RK4 method and writing them to file - dt=0.1
    gfile << y_zero << " ";
    wfile << "dt=0.1" << std::endl;
    for(int i=1; i<n_2; i++)
    {
        gsl_vector_set(y_se, i, rk4(gsl_vector_get(y_se, i-1), 0.1, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_se, i) << " " ;
        wfile.width(20);
        wfile << gsl_vector_get(y_se, i) << std::endl;
        gfile << gsl_vector_get(y_se, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting results of RK4 method and writing them to file - dt=0.01
    gfile << y_zero << " ";
    wfile << "dt=0.01" << std::endl;
    for(int i=1; i<n_3; i++)
    {
        gsl_vector_set(y_th, i, rk4(gsl_vector_get(y_th, i-1), 0.01, lambda));
        wfile.width(20);
        wfile << gsl_vector_get(t_th, i) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(y_th, i) << std::endl;
        gfile << gsl_vector_get(y_th, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    wfile << "*************************ZAD1_3_B*************************" << std::endl;

    gsl_vector *global_error_fi = gsl_vector_calloc(n_1);
    gsl_vector *global_error_se = gsl_vector_calloc(n_2);
    gsl_vector *global_error_th = gsl_vector_calloc(n_3);

    //getting global error for dt=1.0 and writing it to file
    wfile << "y(t) - y_anali for dt=1.0" << std::endl;
    for(int i=0; i<n_1; i++)
    {
        gsl_vector_set(global_error_fi, i, gsl_vector_get(y_fi, i) - gsl_vector_get(y_anali, i/0.01));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_fi, i) << std::endl;
        gfile << gsl_vector_get(global_error_fi, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting global error for dt=0.1 and writing it to file
    wfile << "y(t) - y_anali for dt=0.1" << std::endl;
    for(int i=0; i<n_2; i++)
    {
        gsl_vector_set(global_error_se, i, gsl_vector_get(y_se, i) - gsl_vector_get(y_anali, i/0.1));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_se, i) << std::endl;
        //if(gsl_vector_get(global_error_se, i) < 0.0001 && gsl_vector_get(global_error_se, i) > -0.0001)
        //    gfile << 0 << " ";
        //else
            gfile << gsl_vector_get(global_error_se, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    //getting global error for dt=0.01 and writing it to file
    wfile << "y(t) - y_anali for dt=0.01" << std::endl;
    for(int i=0; i<n_3; i++)
    {
        gsl_vector_set(global_error_th, i, gsl_vector_get(y_th, i) - gsl_vector_get(y_anali, i/1.0));
        wfile.width(20);
        wfile << gsl_vector_get(global_error_th, i) << std::endl;
        //if(gsl_vector_get(global_error_th, i) < 0.0001 && gsl_vector_get(global_error_th, i) > -0.0001)
        //    gfile << 0 << " ";
        //else
            gfile << gsl_vector_get(global_error_th, i) << " ";
    }

    wfile << std::endl << std::endl;
    gfile << std::endl;

    gsl_vector_free(global_error_fi);
    gsl_vector_free(global_error_se);
    gsl_vector_free(global_error_th);
}

//**************************************************************ZAD2_1
void zad2_1(std::fstream &gfile, std::fstream &wfile, double dt, double R, double L, double C, double w_v, double T_0, double q_zero, double i_zero, gsl_vector *t, gsl_vector *q, gsl_vector *i)
{
    gfile << std::fixed;
    wfile << std::fixed; 
    
    wfile << "*************************ZAD2_1 for w_v = "<< w_v <<"*************************" << std::endl;

    wfile << "q(t)" << std::endl;

    gfile << q_zero << " ";
    for(int j=1; j<4*T_0/dt; j++)
    {
        gsl_vector_set(q, j, rk4_q(gsl_vector_get(q, j-1), gsl_vector_get(i, j-1), dt, gsl_vector_get(t, j-1), R, L, C, w_v));
        gsl_vector_set(i, j, rk4_i(gsl_vector_get(q, j-1), gsl_vector_get(i, j-1), dt, gsl_vector_get(t, j-1), R, L, C, w_v));
        wfile.width(20);
        wfile << gsl_vector_get(t, j) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(q, j) << std::endl;
        //if(gsl_vector_get(q, j) < 0.0001 && gsl_vector_get(q, j) > -0.0001)
        //    gfile << 0 << " ";
        //else
            gfile << gsl_vector_get(q, j) << " ";
    }

    gfile << std::endl;
    wfile << std::endl << std::endl;

    wfile << "i(t)" << std::endl;

    gfile << i_zero << " ";
    for(int j=1; j<4*T_0/dt; j++)
    {
        gsl_vector_set(i, j, rk4_i(gsl_vector_get(q, j-1), gsl_vector_get(i, j-1), dt, gsl_vector_get(t, j-1), R, L, C, w_v));
        wfile.width(20);
        wfile << gsl_vector_get(t, j) << " ";
        wfile.width(20);
        wfile << gsl_vector_get(i, j) << std::endl;
        //if(gsl_vector_get(i, j) < 0.0001 && gsl_vector_get(i, j) > -0.0001)
        //    gfile << 0 << " ";
        //else
            gfile << gsl_vector_get(i, j) << " ";
    }

    gfile << std::endl;
    wfile << std::endl << std::endl;
}

//**************************************************************EXTRA_FUNCTIONS
double euler(double y_n, double dt, double lambda)
{
    return y_n + dt*lambda*y_n;
}

double rk2(double y_n, double dt, double lambda)
{
    double k1 = lambda*y_n;
    double k2 = lambda*(y_n + dt*k1);
    return y_n + dt*(k1 + k2)/2.0;
}

double rk4(double y_n, double dt, double lambda)
{
    double k1 = lambda*y_n;
    double k2 = lambda*(y_n + dt*k1/2.0);
    double k3 = lambda*(y_n + dt*k2/2.0);
    double k4 = lambda*(y_n + dt*k3);
    return y_n + dt*(k1 + 2.0*k2 + 2.0*k3 + k4)/6.0;
}

double rk4_q(double q_n, double i_n, double dt, double t, double R, double L, double C, double w_v)
{
    double V_n = 10*sin(w_v*t);
    double V_n_plus_half_dt = 10*sin(w_v*(t+0.00005));
    double V_n_plus_dt = 10*sin(w_v*(t+0.0001));
    double k1_q = i_n;
    double k1_i = V_n/L - q_n/(C*L) - (R*i_n)/L;
    double k2_q = i_n + dt*k1_i/2.0;
    double k2_i = V_n_plus_half_dt/L - (q_n + dt*k1_q/2.0)/(C*L) - R*(i_n + dt*k1_i/2.0)/L;
    double k3_q = i_n + dt*k2_i/2.0;
    double k3_i = V_n_plus_half_dt/L - (q_n + dt*k2_q/2.0)/(C*L) - R*(i_n + dt*k2_i/2.0)/L;
    double k4_q = i_n + dt*k3_i;
    double k4_i = V_n_plus_dt/L - (q_n + dt*k3_q)/(C*L) - R*(i_n + dt*k3_i)/L;
    return (q_n + dt*(k1_q + 2.0*k2_q + 2.0*k3_q + k4_q)/6.0);
}

double rk4_i(double q_n, double i_n, double dt, double t, double R, double L, double C, double w_v)
{
    double V_n = 10*sin(w_v*t);
    double V_n_plus_half_dt = 10*sin(w_v*(t+0.00005));
    double V_n_plus_dt = 10*sin(w_v*(t+0.0001));
    double k1_q = i_n;
    double k1_i = V_n/L - q_n/(C*L) - (R*i_n)/L;
    double k2_q = i_n + dt*k1_i/2.0;
    double k2_i = V_n_plus_half_dt/L - (q_n + dt*k1_q/2.0)/(C*L) - R*(i_n + dt*k1_i/2.0)/L;
    double k3_q = i_n + dt*k2_i/2.0;
    double k3_i = V_n_plus_half_dt/L - (q_n + dt*k2_q/2.0)/(C*L) - R*(i_n + dt*k2_i/2.0)/L;
    double k4_q = i_n + dt*k3_i;
    double k4_i = V_n_plus_dt/L - (q_n + dt*k3_q)/(C*L) - R*(i_n + dt*k3_i)/L;
    return (i_n + dt*(k1_i + 2.0*k2_i + 2.0*k3_i + k4_i)/6.0);
}