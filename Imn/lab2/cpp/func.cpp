#include <iostream>
#include <fstream>
#include <cmath>
#include "/usr/include/gsl/gsl_math.h"
#include "/usr/include/gsl/gsl_linalg.h"
#include "/usr/include/gsl/gsl_deriv.h"


void zad1(std::fstream &file){
    double beta = 0.001;
    double N = 500.;
    double gamma = 0.1;
    double t_max = 100.;
    double dt = 0.1;
    double u_0 = 1.;
    double TOL = 1e-6;
    double max_fi = 20.;

    gsl_vector *t = gsl_vector_calloc(t_max/dt + 1);
    for(int i=0; i<t_max/dt + 1; i++){
        gsl_vector_set(t, i, i*dt);
        file << gsl_vector_get(t, i) << " ";
    }
    file << std::endl;

    gsl_vector *u = gsl_vector_calloc(t_max/dt + 1);
    gsl_vector_set(u, 0, u_0);
    file << gsl_vector_get(u, 0) << " ";

    for(int i=1; i<t_max/dt+1; i++){
        double u_tmp = gsl_vector_get(u, i-1);
        for(int j=0; j<max_fi; j++){
            double alpha = beta*N - gamma;
            gsl_vector_set(u, i, gsl_vector_get(u, i-1) + dt/2*((alpha*gsl_vector_get(u, i-1) - beta*gsl_vector_get(u, i-1)*gsl_vector_get(u, i-1)) + (alpha*u_tmp - beta*u_tmp*u_tmp)));
            if(fabs(gsl_vector_get(u, i) - u_tmp) < TOL){
                break;
            }
            u_tmp=gsl_vector_get(u, i);
        }
        file << gsl_vector_get(u, i) << " ";
    }
    file << std::endl;

    gsl_vector *z = gsl_vector_calloc(t_max/dt + 1);
    gsl_vector_set(z, 0, N-u_0);
    file << gsl_vector_get(z, 0) << " ";
    for(int i=1; i<t_max/dt+1; i++){
        gsl_vector_set(z, i, N - gsl_vector_get(u, i));
        file << gsl_vector_get(z, i) << " ";
    }
    file << std::endl;

    gsl_vector_free(t);
    gsl_vector_free(u);
    gsl_vector_free(z);
}

void zad2(std::fstream &file){
    double beta = 0.001;
    double N = 500.;
    double gamma = 0.1;
    double t_max = 100.;
    double dt = 0.1;
    double u_0 = 1.;
    double TOL = 1e-6;
    double max_fi = 20.;

    gsl_vector *t = gsl_vector_calloc(t_max/dt + 1);
    for(int i=0; i<t_max/dt + 1; i++){
        gsl_vector_set(t, i, i*dt);
    }

    gsl_vector *u = gsl_vector_calloc(t_max/dt + 1);
    gsl_vector_set(u, 0, u_0);
    file << gsl_vector_get(u, 0) << " ";

    for(int i=1; i<t_max/dt+1; i++){
        double u_tmp = gsl_vector_get(u, i-1);
        for(int j=0; j<max_fi; j++){
            double alpha = beta*N - gamma;
            gsl_vector_set(u, i, u_tmp - (u_tmp - gsl_vector_get(u, i-1) - dt/2*((alpha*gsl_vector_get(u, i-1) - beta*gsl_vector_get(u, i-1)*gsl_vector_get(u, i-1)) + (alpha*u_tmp - beta*u_tmp*u_tmp))) / (1-dt/2*(alpha - 2*beta*u_tmp)));
            if(fabs(gsl_vector_get(u, i) - u_tmp) < TOL){
                break;
            }
            u_tmp=gsl_vector_get(u, i);
        }
        file << gsl_vector_get(u, i) << " ";
    }
    file << std::endl;

    gsl_vector *z = gsl_vector_calloc(t_max/dt + 1);
    gsl_vector_set(z, 0, N-u_0);
    file << gsl_vector_get(z, 0) << " ";
    for(int i=1; i<t_max/dt+1; i++){
        gsl_vector_set(z, i, N - gsl_vector_get(u, i));
        file << gsl_vector_get(z, i) << " ";
    }
    file << std::endl;

    gsl_vector_free(t);
    gsl_vector_free(u);
    gsl_vector_free(z);
}

void zad3(std::fstream &file){
    double beta = 0.001;
    double N = 500.;
    double gamma = 0.1;
    double t_max = 100.;
    double dt = 0.1;
    double u_0 = 1.;
    double TOL = 1e-6;
    double max_fi = 20.;

    double c1 = 0.5 - sqrt(3)/6;
    double c2 = 0.5 + sqrt(3)/6;
    double a11 = 0.25;
    double a12 = 0.25 - sqrt(3)/6;
    double a21 = 0.25 + sqrt(3)/6;
    double a22 = 0.25;
    double b1 = 0.5;
    double b2 = 0.5;

    gsl_vector *t = gsl_vector_calloc(t_max/dt + 1);
    for(int i=0; i<t_max/dt + 1; i++){
        gsl_vector_set(t, i, i*dt);
    }

    gsl_vector *u = gsl_vector_calloc(t_max/dt + 1);
    gsl_vector_set(u, 0, u_0);
    file << gsl_vector_get(u, 0) << " ";

    for(int i=1; i<t_max/dt+1; i++){
        double u_tmp = gsl_vector_get(u, i-1);
        for(int j=0; j<max_fi; j++){
            double alpha = beta*N - gamma;
            double U_1 = u_tmp;
            double U_2 = u_tmp;
            double F1 = 0.;
            double F2 = 0.;
            double dU1 = 0.;
            double dU2 = 0.;
            double m11 = 0.;
            double m12 = 0.;
            double m21 = 0.;
            double m22 = 0.; 

            for(int k=0; k<max_fi; k++){
                F1 = U_1 - gsl_vector_get(u, i-1) - dt*(a11*(alpha*U_1-beta*U_1*U_1)+a12*(alpha*U_2-beta*U_2*U_2));
                F2 = U_2 - gsl_vector_get(u, i-1) - dt*(a11*(alpha*U_1-beta*U_1*U_1)+a12*(alpha*U_2-beta*U_2*U_2));
                m11 = 1 - dt*a11*(alpha-2*beta*U_1);
                m12 = -1*dt*a12*(alpha-2*beta*U_2);
                m21 = -1*dt*a21*(alpha-2*beta*U_1);
                m22 = 1 - dt*a22*(alpha-2*beta*U_2); 
                dU1 = (F2*m12 - F1*m22)/(m11*m22 - m12*m21);
                dU2 = (F1*m21 - F2*m11)/(m11*m22 - m12*m21);
                U_1 += dU1;
                U_2 += dU2;
                if(fabs(dU1) < TOL && fabs(dU2) < TOL){
                    break;
                }
            }
            gsl_vector_set(u, i, gsl_vector_get(u, i-1) + dt*(b1*(alpha*U_1 - beta*U_1*U_1) + b2*(alpha*U_2 - beta*U_2*U_2)));
            if(fabs(gsl_vector_get(u, i) - u_tmp) < TOL){
                break;
            }
            u_tmp=gsl_vector_get(u, i);
        }
        file << gsl_vector_get(u, i) << " ";
    }
    file << std::endl;

    gsl_vector *z = gsl_vector_calloc(t_max/dt + 1);
    gsl_vector_set(z, 0, N-u_0);
    file << gsl_vector_get(z, 0) << " ";
    for(int i=1; i<t_max/dt+1; i++){
        gsl_vector_set(z, i, N - gsl_vector_get(u, i));
        file << gsl_vector_get(z, i) << " ";
    }
    file << std::endl;

    gsl_vector_free(t);
    gsl_vector_free(u);
    gsl_vector_free(z);
}