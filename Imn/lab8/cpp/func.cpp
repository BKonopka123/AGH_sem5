#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>
#include <sstream>

const int nx = 400;
const int ny = 90;
const int i_one = 200;
const int i_two = 210;
const int j_one = 50;
const double d = 0.01;
const double sigma = 10.0 * d;
const double xa = 0.45;
const double ya = 0.45;
const int it_max = 10000;

double x(int i);
double y(int j);
double t(int k, double dt);
void create_grids(std::fstream &f_grid_x, std::fstream &f_grid_y);
double u(double x, double y);
void zad(std::fstream &f_grid_t1, std::fstream &f_c_0, std::fstream &f_c_01, std::fstream &f_xsr_0, std::fstream &f_xsr_01, std::fstream &f_u_0_1, std::fstream &f_u_0_2, std::fstream &f_u_0_3, std::fstream &f_u_0_4, std::fstream &f_u_0_5, std::fstream &f_u_01_1, std::fstream &f_u_01_2, std::fstream &f_u_01_3, std::fstream &f_u_01_4, std::fstream &f_u_01_5, std::fstream &f_v_x, std::fstream &f_v_y);
void calculate_ucxsr(std::fstream &f_c, std::fstream &f_xsr, std::fstream &f_u_1, std::fstream &f_u_2, std::fstream &f_u_3, std::fstream &f_u_4, std::fstream &f_u_5, double dd, double vx[nx+1][ny+1], double vy[nx+1][ny+1], double dt);

void zad(std::fstream &f_grid_t1, std::fstream &f_c_0, std::fstream &f_c_01, std::fstream &f_xsr_0, std::fstream &f_xsr_01, std::fstream &f_u_0_1, std::fstream &f_u_0_2, std::fstream &f_u_0_3, std::fstream &f_u_0_4, std::fstream &f_u_0_5, std::fstream &f_u_01_1, std::fstream &f_u_01_2, std::fstream &f_u_01_3, std::fstream &f_u_01_4, std::fstream &f_u_01_5, std::fstream &f_v_x, std::fstream &f_v_y){
    
    std::ifstream file("psi.dat");
    std::string line;
    double psi[nx+1][ny+1];

    while (std::getline(file, line)){
        std::istringstream iss(line);
        size_t i, j;
        double temp_psi;
        if (iss >> i >> j >> temp_psi) {
            psi[i][j] = temp_psi;
        } else {
            std::cerr << "Error parsing line: " << line << std::endl;
        }
    }

    double vx[nx+1][ny+1];
    double vy[nx+1][ny+1];

    for (int i=0; i<=nx; ++i) {
        for (int j=0; j<=ny; ++j) {
            vx[i][j] = 0.0;
            vy[i][j] = 0.0;
        }
    }

    for (int i=1; i<nx; ++i) {
        for (int j=1; j<ny; ++j) {
            vx[i][j] = (psi[i][j+1] - psi[i][j-1]) / (2.0 * d);
            vy[i][j] = -(psi[i+1][j] - psi[i-1][j]) / (2.0 * d);
        }
    }

    for(int i=i_one; i<=i_two; ++i){
        for(int j=0; j<=j_one; ++j){
            vx[i][j] = 0.0;
            vy[i][j] = 0.0;
        }
    }

    for(int i=1; i<nx; ++i){
        vx[i][0] = 0.0;
        vy[i][ny] = 0.0;
    }

    for(int j=0; j<=ny; ++j){
        vx[0][j] = vx[1][j];
        vx[nx][j] = vx[nx-1][j];
    }

    f_v_x << std::fixed;
    f_v_y << std::fixed;
    for(int j=0; j<=ny; ++j){
        for(int i=0; i<=nx; ++i){
            f_v_x << vx[i][j] << " ";
            f_v_y << vy[i][j] << " ";
        }
        f_v_x << std::endl;
        f_v_y << std::endl;
    }

    double v_max = 0.0;
    double v_magnitude;

    for (int i=0; i<=nx; ++i) {
        for (int j=0; j<=ny; ++j) {
            v_magnitude = std::sqrt(pow(vx[i][j],2) + pow(vy[i][j],2));
            if (v_magnitude > v_max) {
                v_max = v_magnitude;
            }
        }
    }

    double dt = d / (4.0 * v_max);
    for (int it=1; it<it_max; ++it) {
        f_grid_t1 << t(it, dt) << std::endl;
    }

    calculate_ucxsr(f_c_0, f_xsr_0, f_u_0_1, f_u_0_2, f_u_0_3, f_u_0_4, f_u_0_5, 0.0, vx, vy, dt);
    calculate_ucxsr(f_c_01, f_xsr_01, f_u_01_1, f_u_01_2, f_u_01_3, f_u_01_4, f_u_01_5, 0.1, vx, vy, dt);
}

void calculate_ucxsr(std::fstream &f_c, std::fstream &f_xsr, std::fstream &f_u_1, std::fstream &f_u_2, std::fstream &f_u_3, std::fstream &f_u_4, std::fstream &f_u_5, double dd, double vx[nx+1][ny+1], double vy[nx+1][ny+1], double dt){

    double u0[nx+1][ny+1];
    double u1[nx+1][ny+1];
    for(int j=0; j<=ny; ++j){
        for(int i=0; i<=nx; ++i){
            u0[i][j]=0.0;
            u1[i][j]=0.0;
        }
    }

    for(int i=0; i<=nx; ++i){
        for(int j=0; j<=ny; ++j){
            u0[i][j] = u(x(i), y(j));
        }
    }

    for(int it=1; it<it_max; ++it){

        for(int i=0; i<=nx; ++i){
            for(int j=0; j<=ny; ++j){
                u1[i][j] = u0[i][j];
            }
        }

        for(int kit=1; kit<=20; ++kit){
            for(int i=0; i<=nx; ++i){
                for(int j=1; j<ny; ++j){
                    if (i >= i_one && i <= i_two && j >= 0 && j <= j_one){
                        continue;
                    }
                    else if(i==0){
                        u1[i][j] = (u0[i][j] - dt * vx[i][j] / 2.0 * (((u0[i+1][j] - u0[nx][j]) / (2.0 * d)) + ((u1[i+1][j] - u1[nx][j]) / (2.0 * d))) - dt * vy[i][j] / 2.0 * (((u0[i][j+1] - u0[i][j-1]) / (2.0 * d)) + ((u1[i][j+1] - u1[i][j-1]) / (2.0 * d))) + dt * dd / 2.0
                                   * ((u0[i+1][j] + u0[nx][j] + u0[i][j+1] + u0[i][j-1] - 4.0 * u0[i][j]) / (pow(d,2)) + ((u1[i+1][j] + u1[nx][j] + u1[i][j+1] + u1[i][j-1]) / (pow(d,2))))) / (1.0 + (2.0 * dd * dt) / (pow(d,2)));
                    }
                    else if(i==nx){
                        u1[i][j] = (u0[i][j] - dt * vx[i][j] / 2.0 * (((u0[0][j] - u0[i-1][j]) / (2.0 * d)) + ((u1[0][j] - u1[i-1][j]) / (2.0 * d))) - dt * vy[i][j] / 2.0 * (((u0[i][j+1] - u0[i][j-1]) / (2.0 * d)) + ((u1[i][j+1] - u1[i][j-1]) / (2.0 * d))) + dt * dd / 2.0
                                   * ((u0[0][j] + u0[i-1][j] + u0[i][j+1] + u0[i][j-1] - 4.0 * u0[i][j]) / (pow(d,2)) + ((u1[0][j] + u1[i-1][j] + u1[i][j+1] + u1[i][j-1]) / (pow(d,2))))) / (1.0 + (2.0 * dd * dt) / (pow(d,2)));
                    }
                    else{
                        u1[i][j] = (u0[i][j] - dt * vx[i][j] / 2.0 * (((u0[i+1][j] - u0[i-1][j]) / (2.0 * d)) + ((u1[i+1][j] - u1[i-1][j]) / (2.0 * d))) - dt * vy[i][j] / 2.0 * (((u0[i][j+1] - u0[i][j-1]) / (2.0 * d)) + ((u1[i][j+1] - u1[i][j-1]) / (2.0 * d))) + dt * dd / 2.0
                                   * ((u0[i+1][j] + u0[i-1][j] + u0[i][j+1] + u0[i][j-1] - 4.0 * u0[i][j]) / (pow(d,2)) + ((u1[i+1][j] + u1[i-1][j] + u1[i][j+1] + u1[i][j-1]) / (pow(d,2))))) / (1.0 + (2.0 * dd * dt) / (pow(d,2)));
                    }
                }
            }
        }
        
        for(int i=0; i<=nx; ++i){
            for(int j=0; j<=ny; ++j){
                u0[i][j] = u1[i][j];
            }
        }

        std::cout << "\r[" << it << "]" << std::string(7, ' ');

        double c_tmp = 0.0;
        for(int i=0; i<=nx; ++i){
            for(int j=0; j<=ny; ++j){
                c_tmp += u0[i][j] * pow(d,2);
            }
        }
        f_c << c_tmp << std::endl;

        double xsr_tmp = 0.0;
        for(int i=0; i<=nx; ++i){
            for(int j=0; j<=ny; ++j){
                xsr_tmp += u0[i][j] * x(i) * pow(d,2);
            }
        }
        f_xsr << xsr_tmp << std::endl;

        f_u_1 << std::fixed;
        f_u_2 << std::fixed;
        f_u_3 << std::fixed;
        f_u_4 << std::fixed;
        f_u_5 << std::fixed;
        if(it == it_max/5.0){
            for(int j=0; j<=ny; ++j){
                for(int i=0; i<=nx; ++i){
                    f_u_1 << u0[i][j] << " ";
                }
                f_u_1 << std::endl;
            }
        }
        if(it == 2.0*it_max/5.0){
            for(int j=0; j<=ny; ++j){
                for(int i=0; i<=nx; ++i){
                    f_u_2 << u0[i][j] << " ";
                }
                f_u_2 << std::endl;
            }
        }
        if(it == 3.0*it_max/5.0){
            for(int j=0; j<=ny; ++j){
                for(int i=0; i<=nx; ++i){
                    f_u_3 << u0[i][j] << " ";
                }
                f_u_3 << std::endl;
            }
        }
        if(it == 4.0*it_max/5.0){
            for(int j=0; j<=ny; ++j){
                for(int i=0; i<=nx; ++i){
                    f_u_4 << u0[i][j] << " ";
                }
                f_u_4 << std::endl;
            }
        }
        if(it == it_max-1){
            for(int j=0; j<=ny; ++j){
                for(int i=0; i<=nx; ++i){
                    f_u_5 << u0[i][j] << " ";
                }
                f_u_5 << std::endl;
            }
        }
    }

}

double x(int i){
    return d*i;
}

double y(int j){
    return d*j;
}

double t(int k, double dt){
    return dt*k;
}

void create_grids(std::fstream &f_grid_x, std::fstream &f_grid_y){
    f_grid_x << std::fixed;
    f_grid_y << std::fixed;
    f_grid_x << std::setprecision(6);
    f_grid_y << std::setprecision(6);

    for (int i=0; i<=nx; ++i) {
        f_grid_x << x(i) << std::endl;
    }

    for (int j=0; j<=ny; ++j) {
        f_grid_y << y(j) << std::endl;
    }
}

double u(double x, double y){
    return std::exp(-(pow((x - xa),2) + pow((y - ya),2)) / (2.0 * pow(sigma,2))) / (2.0 * M_PI * pow(sigma,2));
}