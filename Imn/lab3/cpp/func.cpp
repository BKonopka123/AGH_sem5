#include <iostream>
#include <fstream>
#include <cmath>
#include <vector>


void zad(std::fstream &file, double TOL, std::pair<double, double> (*f)(double, double, double, double));
std::pair<double, double> trapezoidal(double x_n, double v_n, double dt, double alpha);
std::pair<double, double> RK2(double x_n, double v_n, double dt, double alpha);
double control_step(double dt, double S, double TOL, int p, double Ex, double Ev);
double f(double t, double x, double v, double alpha);
double g(double t, double x, double v, double alpha);

void zad(std::fstream &file, double TOL, std::pair<double, double> (*f)(double, double, double, double)){
    
    file << std::fixed;

    double x_0 = 0.01;
    double v_0 = 0.0;
    double dt_0 = 1.0;
    double S = 0.75;
    double p = 2.0;
    double t_max = 40.0;
    double alpha = 5.0;

    double tt = 0;

    std::vector<double> x;
    std::vector<double> v;
    std::vector<double> t;
    std::vector<double> dt;
    std::vector<double> dt_extra;
    x.push_back(x_0);
    v.push_back(v_0);
    t.push_back(tt);
    dt.push_back(dt_0);
    dt_extra.push_back(dt_0);

    while(tt < t_max){
        auto result1 = f(x.back(), v.back(), dt.back(), alpha);
        auto result2 = f(result1.first, result1.second, dt.back(), alpha);
        auto result21 = f(x.back(), v.back(), 2 * dt.back(), alpha);

        double Ex = (result2.first - result21.first) / (std::pow(2, p) - 1);
        double Ev = (result2.second - result21.second) / (std::pow(2, p) - 1);

        if (std::max(std::abs(Ex), std::abs(Ev)) < TOL) {
            tt += 2 * dt.back();
            x.push_back(result2.first);
            v.push_back(result2.second);
            t.push_back(tt);
            dt_extra.push_back(dt.back());
        }
        dt.push_back(control_step(dt.back(), S, TOL, p, Ex, Ev));
    }

    for(auto i : t){
        file << i << " ";
    }
    file << std::endl;
    
    for(auto i : x){
        file << i << " ";
    }
    file << std::endl;

    for(auto i : v){
        file << i << " ";
    }
    file << std::endl;

    for(auto i : dt_extra){
        file << i << " ";
    }
    file << std::endl;
}

std::pair<double, double> trapezoidal(double x_n, double v_n, double dt, double alpha){
    
    double x_n_1 = x_n;
    double v_n_1 = v_n;
    double a11 = 1.0;
    double a12 = -dt / 2.0;

    while(true){
        double F_tmp = x_n_1 - x_n - dt/2.0 * (f(0, x_n, v_n, alpha) + f(0, x_n_1, v_n_1, alpha));
        double G_tmp = v_n_1 - v_n - dt/2.0 * (g(0, x_n, v_n, alpha) + g(0, x_n_1, v_n_1, alpha));
        
        double a21 = -0.5 * dt * (-2 * alpha * x_n_1 * v_n_1 - 1);
        double a22 = 1 - 0.5 * dt * alpha * (1 - x_n_1 * x_n_1);

        double dx = (-F_tmp * a22 + G_tmp * a12) / (a11 * a22 - a12 * a21);
        double dv = (F_tmp * a21 - G_tmp * a11) / (a11 * a22 - a12 * a21);

        x_n_1 += dx;
        v_n_1 += dv;

        if(std::max(std::abs(dx), std::abs(dv)) < 1e-10) 
            break;
    }

    return {x_n_1, v_n_1};
}

std::pair<double, double> RK2(double x_n, double v_n, double dt, double alpha){
    double k1x = f(0, x_n, v_n, alpha);
    double k1v = g(0, x_n, v_n, alpha);
    double k2x = f(0, x_n + dt * k1x, v_n + dt * k1v, alpha);
    double k2v = g(0, x_n + dt * k1x, v_n + dt * k1v, alpha);
    double x_n_1 = x_n + 0.5 * dt * (k1x + k2x);
    double v_n_1 = v_n + 0.5 * dt * (k1v + k2v);
    return {x_n_1, v_n_1};
}

double control_step(double dt, double S, double TOL, int p, double Ex, double Ev){
    return std::pow((S * TOL) / std::max(std::abs(Ex), std::abs(Ev)), 1.0 / (p + 1.0)) * dt;
}

double f(double t, double x, double v, double alpha){
    return v;
}

double g(double t, double x, double v, double alpha){
    return alpha * (1 - x * x) * v - x;
}