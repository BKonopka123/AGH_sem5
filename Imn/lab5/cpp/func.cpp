#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>

const double d = 0.2;
const int nx = 128;
const int ny = 128;
const double x_max = d*nx;
const double y_max = d*ny;
const double TOL = 1e-8;

void zad(std::fstream &file);
double calc_vb1(int j);
double calc_vb2(int i);
double calc_vb3(int j);
double calc_vb4(int i);
double calc_S(double V[128+1][128+1], int ks);


void zad(std::fstream &file){
    file << std::fixed;

    double V[128+1][128+1];

    for(int j=0; j<=ny; ++j){
        for(int i=0; i<=nx; ++i){
            V[i][j]=0.0;
        }
    }

    for (int i=0; i<=nx; ++i) {
        V[i][ny] = calc_vb2(i);
        V[i][0] = calc_vb4(i);
    }

    for (int j = 0; j<=ny; ++j) {
        V[0][j] = calc_vb1(j);
        V[nx][j] = calc_vb3(j);
    }

    int ks[] = {16, 8, 4, 2, 1};
    int it = 0;

    for(int k : ks){
        std::cout << "k = " << k << std::endl;

        double s_prev = TOL;
        double s_next;

        while(true){

            ++it;

            for(int j=k; j<ny; j+=k){ //dodac -k
                for(int i=k; i<nx; i+=k) {
                    V[i][j] = 0.25*(V[i+k][j] + V[i-k][j] + V[i][j+k] + V[i][j-k]);
                }
            }

            s_next=calc_S(V, k);

            file << s_next << " ";

            if(std::abs((s_next - s_prev) / s_prev) < TOL){
                break;
            }
            s_prev = s_next;
        }

        file << std::endl;

        file << it;

        file << std::endl;

        
        for(int j=0; j<=ny; j+=k){
            for(int i=0; i<=nx; i+=k){
                file << V[i][j] << " ";
            }
            file << std::endl;
        }


        if(k!=1){
            for(int j=0; j<ny; j+=k) {
                for(int i=0; i<nx; i+=k){
                    V[i+k/2][j+k/2] = 0.25 * (V[i][j] + V[i+k][j] + V[i][j+k] + V[i+k][j+k]);
                    V[i+k][j+k/2] = 0.5 * (V[i+k][j] + V[i+k][j+k]);
                    V[i+k/2][j+k] = 0.5 * (V[i][j+k] + V[i+k][j+k]);
                    V[i+k/2][j] = 0.5 * (V[i][j] + V[i+k][j]);
                    V[i][j+k/2] = 0.5 * (V[i][j] + V[i][j+k]);
                }
            }
        }

        for(int i=0; i<=nx; ++i){
            V[i][ny] = calc_vb2(i);
            V[i][0] = calc_vb4(i);
        }

        for(int j=0; j<=ny; ++j){
            V[0][j] = calc_vb1(j);
            V[nx][j] = calc_vb3(j);
        }
    }

}

double calc_vb1(int j){
    return std::sin(M_PI * d * j / y_max);
}

double calc_vb2(int i){
    return -std::sin(2.0 * M_PI * d * i / x_max);
}

double calc_vb3(int j){
    return std::sin(M_PI * d * j / y_max);
}

double calc_vb4(int i){
    return std::sin(2.0 * M_PI * d * i / x_max);
}

double calc_S(double V[128+1][128+1], int ks){
    double S=0.0;
    
    for(int j=0; j<ny; j+=ks){ //dodac -k jak cos
        for(int i=0; i<nx; i+=ks){
            S += 0.5*ks*ks*d*d*( pow(((V[i+ks][j] - V[i][j] + V[i+ks][j+ks] - V[i][j+ks]) / (2.0 * ks * d)),2) +
                               pow(((V[i][j+ks] - V[i][j] + V[i+ks][j+ks] - V[i+ks][j]) / (2.0 * ks * d)),2) );
        }
    }
    return S;
}
