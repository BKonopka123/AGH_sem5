#include <math.h>
#include <stdio.h>
#include "mgmres.h"

double rho(int x, int y, double d, double xmax, double ymax){
	double sigma = xmax / 10.0;
	double dx = d * x;
	double dy = d * y;
	double rho1 = exp(-pow((dx - 0.25 * xmax) / sigma, 2) - pow((dy - 0.5 * ymax) / sigma, 2));
	double rho2 = -exp(-pow((dx - 0.75 * xmax) / sigma, 2) - pow((dy - 0.5 * ymax) / sigma, 2));
	return rho1 + rho2;
}

int j(int l, int nx){
	return l / (nx + 1);
}

int i(int l, int nx){
	return l - j(l, nx) * (nx + 1);
}

void metodaPoissona(int nx, int ny, double e1, double e2, double V1, double V2, double V3,double V4, char useRho, FILE *fp, char result_type){
	double d = 0.1;
	int N = (nx + 1) * (ny + 1);
	double xmax = d * nx;
	double ymax = d * ny;
	double a[5*N]; 
	double b[N]; 
	double V[N];
	int ja[5*N];
	int ia[N+1];

	for(int i=0; i < 5*N; i++){
		a[i] = 0;
		ja[i] = 0;
	}

	for(int i=0; i < N+1; i++){
		ia[i] = -1;
	}

	for(int i=0; i < N; i++){
		b[i] = 0;
		V[i] = 0;
	}

	int k = -1;

	for(int l=0; l<N; l++){
		int brzeg = 0; 
		double vb = 0.0;

		if(i(l, nx) == 0){
			brzeg = 1;
			vb = V1;
		}
		if(j(l, nx) == ny){
			brzeg = 1;
			vb = V2;
		}
		if(i(l, nx) == nx){
			brzeg = 1;
			vb = V3;
		}
		if(j(l, nx) == 0){
			brzeg = 1;
			vb = V4;
		}

		if(brzeg == 1){
			b[l] = vb;
		}
		else{
			if(useRho == 'y')
				b[l] = -rho(i(l, nx), j(l, nx), d, xmax, ymax);
			else
				b[l] = 0;
		}

		ia[l] = -1;

		if(l-nx-1 >= 0 && brzeg == 0){
			k++;
			if(ia[l] < 0)
				ia[l] = k;
			double epsilon = i(l, nx) <= nx/2 ? e1 : e2;
			a[k] = epsilon / pow(d, 2);
			ja[k] = l-nx-1;
		}
		
		if(l-1 >= 0 && brzeg == 0){
			k++;
			if(ia[l] < 0)
				ia[l] = k;
			double epsilon = i(l, nx) <= nx/2 ? e1 : e2;
			a[k] = epsilon / pow(d, 2);
			ja[k] = l-1;
		}

		k++;
		if(ia[l] < 0)
			ia[l] = k;
		if(brzeg == 0){
			double epsilon0 = i(l, nx) <= nx/2 ? e1 : e2;
			double epsilon1 = i(l + 1, nx) <= nx/2 ? e1 : e2;
			double epsilon2 = i(l + nx + 1, nx) <= ny/2 ? e1 : e2;
			a[k] = -(2 * epsilon0 + epsilon1 + epsilon2) / pow(d, 2);
		}
		else
			a[k] = 1;
		ja[k] = l;

		if(l < N && brzeg == 0){
			k++;
			double epsilon = i(l+1, nx) <= nx/2 ? e1 : e2;
			a[k] = epsilon / pow(d, 2);
			ja[k] = l+1;
		}

		if(l < N-nx-1 && brzeg == 0){
			k++;
			double epsilon = i(l+nx+1, nx) <= nx/2 ? e1 : e2;
			a[k] = epsilon / pow(d, 2);
			ja[k] = l+nx+1;
		}

	}
	int nz_num = k + 1;
	ia[N] = nz_num;

	pmgmres_ilu_cr(N, nz_num, ia, ja, a, V, b, 500, 500, 1e-8, 1e-8);

	if(result_type == 'w'){
		fprintf(fp, "# l \t i_l \t j_l \t b[l]\n");
		for(int l = 0; l < N; l++){
			fprintf(fp, "%d \t\t%d \t\t%d \t\t%lf\n", l, i(l, nx), j(l, nx), b[l]);
		}
		fprintf(fp, "# k \t a[k]\n");
		for(int l = 0; l < 5*N; l++){
			fprintf(fp, "%d \t %lf\n", l, a[l]);
		}
	}

	if(result_type == 'd'){
		for(int i = 0; i < N-ny-1; i++){
			fprintf(fp, "%f ",V[i]);
			if(i % (nx + 1) == nx)
				fprintf(fp, "\n");
		}
	}
}

int main()
{
	FILE *fp;

	fp = fopen("RESULT_3.txt", "w");
	metodaPoissona(4, 4, 1, 1, 10, -10, 10, -10, 'n', fp, 'w');
	fclose(fp);

	fp = fopen("5a.txt", "w");
	metodaPoissona(50, 50, 1, 1, 10, -10, 10, -10, 'n', fp, 'd');
	fclose(fp);

	fp = fopen("5b.txt", "w");
	metodaPoissona(100, 100, 1, 1, 10, -10, 10, -10, 'n', fp, 'd');
	fclose(fp);

	fp = fopen("5c.txt", "w");
	metodaPoissona(200, 200, 1, 1, 10, -10, 10, -10, 'n', fp, 'd');
	fclose(fp);

	fp = fopen("6a.txt", "w");
	metodaPoissona(100, 100, 1, 1, 0, 0, 0, 0, 'y', fp, 'd');
	fclose(fp);

	fp = fopen("6b.txt", "w");
	metodaPoissona(100, 100, 1, 2, 0, 0, 0, 0, 'y', fp, 'd');
	fclose(fp);

	fp = fopen("6c.txt", "w");
	metodaPoissona(100, 100, 1, 10, 0, 0, 0, 0, 'y', fp, 'd');
	fclose(fp);

	return 0;
}