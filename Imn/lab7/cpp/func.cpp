#include <iostream>
#include <fstream>
#include <cmath>
#include <array>
#include <iomanip>

const double d=0.01;
const double rho=1.0;
const double mi=1.0;
const int nx=200;
const int ny=90;
const int i_one=50;
const int j_one=55;
const int j_two=j_one+2;
const int it_max=20000; 

void zad(std::fstream &file_u, std::fstream &file_v, std::fstream &file_psi, std::fstream &file_zeta, int q);
double x(int i);
double y(int j);
double q_wy(double q_we);
bool is_edge(int i, int j);
void wb_psi(double psi[nx+1][ny+1], int q);
void wb_zeta(double zeta[nx+1][ny+1], double psi[nx+1][ny+1], int q);

void zad(std::fstream &file_u, std::fstream &file_v, std::fstream &file_psi, std::fstream &file_zeta, int q){
    
    double psi[nx+1][ny+1];
    double zeta[nx+1][ny+1];
    double u[nx+1][ny+1];
    double v[nx+1][ny+1];

    for(int j=0; j<=ny; ++j){
        for(int i=0; i<=nx; ++i){
            psi[i][j]=0.0;
            zeta[i][j]=0.0;
            u[i][j]=0.0;
            v[i][j]=0.0;
        }
    }

    wb_psi(psi, q);

    double omega;
    double gamma;

    for (int it = 1; it<=it_max; ++it) {
        if(it<2000)
            omega=0.0;
        else
            omega=1.0;
            
        for (int j=1; j<ny; ++j){
            for (int i=1; i<nx; ++i){
                if (!is_edge(i, j)){
                    psi[i][j] = (psi[i+1][j] + psi[i-1][j] + psi[i][j+1] + psi[i][j-1] - pow(d,2) * zeta[i][j]) / 4.0;

                    if(omega)
                        zeta[i][j] = (zeta[i+1][j] + zeta[i-1][j] + zeta[i][j+1] + zeta[i][j-1]) / 4.0 - omega * rho / (16.0 * mi) * ((psi[i][j+1] - psi[i][j-1]) * (zeta[i+1][j] - zeta[i-1][j]) - (psi[i+1][j] - psi[i-1][j]) * (zeta[i][j+1] - zeta[i][j-1]));
                    else
                        zeta[i][j] = (zeta[i+1][j] + zeta[i-1][j] + zeta[i][j+1] + zeta[i][j-1]) / 4.0;
                    
                    u[i][j] = (psi[i][j+1] - psi[i][j-1]) / (2.0 * d);

                    v[i][j] = -(psi[i+1][j] - psi[i-1][j]) / (2.0 * d);
                }
            }
        }

        wb_zeta(zeta, psi, q);

        gamma = 0.0;
        for(int i=1; i<nx; ++i){
            gamma += psi[i+1][j_two] + psi[i-1][j_two] + psi[i][j_two+1] + psi[i][j_two-1] - 4.0 * psi[i][j_two] - pow(d,2) * zeta[i][j_two];
        }
        std::cout << "\r[" << it << "] Gamma = " << gamma << std::string(30, ' ');
    }

    for(int i=0; i<i_one; ++i){
        psi[i][0] = std::nan("");
        zeta[i][0] = std::nan("");
        u[i][0] = std::nan("");
        v[i][0] = std::nan("");
    }

    for(int j=0; j<j_one; ++j){
        psi[0][j] = std::nan("");
        zeta[0][j] = std::nan("");
        u[0][j] = std::nan("");
        v[0][j] = std::nan("");
    }

    for(int j=0; j<=ny; ++j){
        for(int i=0; i<=nx; ++i){
            file_u << u[i][j] << " ";
            file_v << v[i][j] << " ";
            file_psi << psi[i][j] << " ";
            file_zeta << zeta[i][j] << " ";
        }
        file_u << std::endl;
        file_v << std::endl;
        file_psi << std::endl;
        file_zeta << std::endl;
    }

}

double x(int i){
    return d * i;
}

double y(int j){
    return d * j;
}

double q_wy(double q_we){
    return q_we * (std::pow(y(ny), 3) - std::pow(y(j_one), 3) - 3.0 * y(j_one) * std::pow(y(ny), 2) + 3.0 * std::pow(y(j_one), 2) * y(ny)) / std::pow(y(ny), 3);
}

bool is_edge(int i, int j){
    if ((i == 0 && j >= j_one && j <= ny) || (i == nx && j >= 0 && j <= ny) || (i >= i_one && i <= nx && j == 0) || (i == i_one && j >= 0 && j <= j_one) || (i == 0 && j >= 0 && j <= i_one) || (i >= 0 && i <= i_one && j == j_one)){
        return true;
    }
    return false;
}

void wb_psi(double psi[nx+1][ny+1], int q){
		
    for(int j=j_one; j<=ny; ++j){
		psi[0][j] = q/(2.0*mi) * (pow(y(j), 3)/3.0 - pow(y(j),2)*(y(j_one) + y(ny))/2.0 + y(j)*y(j_one)*y(ny));
	}

	for(int j=0; j<=ny; ++j){
		psi[nx][j] = q_wy(q)/(2.0*mi) * (pow(y(j), 3)/3.0 - pow(y(j),2)*y(ny)/2.0) + (q*pow(y(j_one),2)*(-y(j_one) + 3.0*y(ny))) / (12.0*mi);
	}

	for(int i=1; i<nx; ++i){
		psi[i][ny] = psi[0][ny];
	}

	for(int i=i_one; i<nx; ++i){
		psi[i][0] = psi[0][j_one];
	}

	for(int j=1; j<=j_one; ++j){
		psi[i_one][j] = psi[0][j_one];
	}

	for(int i=1; i<=i_one; ++i){
		psi[i][j_one] = psi[0][j_one];
	}
}

void wb_zeta(double zeta[nx+1][ny+1], double psi[nx+1][ny+1], int q){
            
        for(int j=j_one; j<=ny; ++j){
            zeta[0][j] = q/(2.0*mi) * (2.0*y(j) - y(j_one) - y(ny));
        }
    
        for(int j=0; j<=ny; ++j){
            zeta[nx][j] = q_wy(q)/(2.0*mi) * (2.0*y(j) - y(ny));
        }
    
        for(int i=1; i<nx; ++i){
            zeta[i][ny] = 2.0/pow(d,2) * (psi[i][ny-1] - psi[i][ny]);
        }
    
        for(int i=i_one+1; i<nx; ++i){
            zeta[i][0] = 2.0/pow(d,2) * (psi[i][1] - psi[i][0]);
        }

        for(int j=1; j<j_one; ++j){
            zeta[i_one][j] = 2.0/pow(d,2) * (psi[i_one+1][j] - psi[i_one][j]);
        }

        for(int i=1; i<=i_one; ++i){
            zeta[i][j_one] = 2.0/pow(d,2) * (psi[i][j_one+1] - psi[i][j_one]);
        }

        zeta[i_one][j_one] = (zeta[i_one-1][j_one] + zeta[i_one][j_one-1]) / 2.0;
}