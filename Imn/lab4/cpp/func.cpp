#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>

void relaksacja_globalna(std::fstream &file, double omega);
void relaksacja_lokalna(std::fstream &file, double omega);
double p(double x, double y);
void fill_p_tab();
double S(double V[150+1][100+1]);

const double epsilon = 1.0;
const double d = 0.1;
const int nx = 150;
const int ny = 100;
const double x_max = nx*d;
const double y_max = ny*d;
const double TOL = 1e-8;
double p_tab[150][100];

void relaksacja_globalna(std::fstream &file, double omega){
    file << std::fixed;
    std::cout << "globalna, omega = " << omega << std::endl;

    double s_prev, s_next = 0.0;

    double V[150+1][100+1];
    for(int j=0; j<ny+1; j++){
        for(int i=0; i<nx+1; i++){
            V[i][j] = 0.0;
        }
    }
    double V_old[150+1][100+1];
    for(int j=0; j<ny+1; j++){
        for(int i=0; i<nx+1; i++){
            V_old[i][j] = 0.0;
        }
    }
    for(int i=0; i<=nx; i++){
        V[i][0] = 10.0;
        V_old[i][0] = 10.0;
    }

    do{
        
        for(int i=1; i<nx; i++){
            for(int j=1; j<ny; j++){
                V[i][j] = 0.25*(V_old[i+1][j] + V_old[i-1][j] + V_old[i][j+1] + V_old[i][j-1] + pow(d,2)/epsilon*p_tab[i][j]);
            }
        }
        for(int j=1; j<ny; j++){
            V[0][j] = V[1][j];
            V[nx][j] = V[nx-1][j];
        }
        for(int i=0; i<=nx; i++){
            for(int j=0; j<=ny; j++){
                V_old[i][j] = (1.0-omega)*V_old[i][j] + omega*V[i][j];
            }
        }

        s_prev = s_next;
        s_next = 0.0;
        s_next = S(V_old);

        file << s_next << " ";
        if (std::abs((s_next - s_prev) / s_prev) < TOL) {
            break;
        }
    
    }while(true);
    file << std::endl;

    for(int j=0; j<ny; j++){
        for(int i=0; i<nx; i++){
            file << V[i][j] << " ";
        }
        file << std::endl;
    }

    double err[150+1][100+1];
    for(int i=1; i<nx; i++){
        for(int j=1; j<ny; j++){
            err[i][j] = (V[i+1][j] - 2.0*V[i][j] + V[i-1][j])/(d*d) + (V[i][j+1] - 2.0 * V[i][j] + V[i][j-1]) / (d*d) + p_tab[i][j] / epsilon;
        }
    }

    for(int j=0; j<ny; j++){
        for(int i=0; i<nx; i++){
            file << err[i][j] << " ";
        }
        file << std::endl;
    }
}

void relaksacja_lokalna(std::fstream &file, double omega){
    file << std::fixed;
    std::cout << "lokalna, omega = " << omega << std::endl;

    double s_prev, s_next = 0.0;

    double V[150+1][100+1];
    for(int j=0; j<ny+1; j++){
        for(int i=0; i<nx+1; i++){
            V[i][j] = 0.0;
        }
    }
    for(int i=0; i<=nx; i++){
        V[i][0] = 10.0;
        V[i][ny-1] = 0.0;
    }

    do{

        for(int i=1; i<nx; i++){
            for(int j=1; j<ny; j++){
                V[i][j] = (1.0-omega)*V[i][j] + omega*0.25*(V[i+1][j] + V[i-1][j] + V[i][j+1] + V[i][j-1] + pow(d,2)/epsilon*p_tab[i][j]);
            }
        }
        for(int j=1; j<ny; j++){ 
            V[0][j] = V[1][j];
            V[nx][j] = V[nx-1][j];
        }

        s_prev = s_next;
        s_next = 0.0;
        s_next = S(V);

        file << s_next << " ";
        if (std::abs((s_next - s_prev) / s_prev) < TOL) {
            break;
        }
    }while(true);
    file << std::endl;
}

double p(double x, double y){
    double sigma_x = 0.1*x_max;
    double sigma_y = 0.1*y_max;
    double p_1 = exp(-1 * pow(((x - 0.35*x_max) / sigma_x),2) - pow(((y - 0.5*y_max) / sigma_y),2));
    double p_2 = -1*exp(-1 * pow(((x - 0.65*x_max) / sigma_x),2) - pow(((y - 0.5*y_max) / sigma_y),2));
    return p_1 + p_2;
}

void fill_p_tab(){ 
    for(int i=0; i<nx; i++){
        for(int j=0; j<ny; j++){
            p_tab[i][j] = p(i, j);
        }
    }
}

double S(double V[150+1][100+1]){
    double S = 0.0;
    for(int i=0; i<nx; i++){
        for(int j=0; j<ny; j++){
            S += pow(d,2) * (0.5 * pow(((V[i+1][j] - V[i][j]) / (d)),2) + 0.5 * pow(((V[i][j+1] - V[i][j]) / (d)),2) - p_tab[i][j]*V[i][j]);
        }
    }
    return S;
}
