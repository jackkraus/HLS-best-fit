#include "main.h"
#include <stdio.h>  // For debug prints, originally iostream
#include <stdlib.h>
#include <string.h>

//#include <ap_int.h>
//#include <ap_fixed.h> // Using fixed-point arithmetic for resource optimization
//#include <hls_stream.h>

/* func: add_nums()
 *
 * This function is only called once so we can init the sums and immediately 
 * 	start adding them together. 
 */
int add_nums(const long arr_x[], const long arr_y[], int size, long* sx, long* sy, long* sxy, long* sxx){
	*sx = 0;
       	*sy = 0;
       	*sxy = 0;
	*sxx = 0;
	
	//printf("<== Starting add_nums LOOP ==>\n");
	for(int i = 0; i < size; i++){
		*sx += arr_x[i];
		*sy += arr_y[i];
		*sxy += arr_x[i]*arr_y[i];
		*sxx += arr_x[i]*arr_x[i];
	}
}

/* func: calc_ovr_sig_sqrd_x()
 *
 * This function adds up all of the inverse squared sigmas in the event array
 * 	and multiplies it by the x's
 */
double calc_ovr_sig_sqrd_x(long arr_sig[], int size, long arr_x[]) {
	double Sx = 0;
	double sig, overSig;

	for(int i = 0; i < size; i++) {
		sig = (double)arr_sig[i];
		overSig = 1/sig; 
		Sx += (double)arr_x[i]*overSig*overSig;	
	}
	return Sx; 
}

/* func: calc_ovr_sig_sqrd_y()
 *
 * This function adds up all of the inverse squared sigmas in the event array
 * 	and multiplies it by the y's
 */
double calc_ovr_sig_sqrd_y(long arr_sig[], int size, long arr_y[]) {
	double Sy = 0;
	double sig, overSig;

	for(int i = 0; i < size; i++) {
		sig = (double)arr_sig[i];
		overSig = 1/sig; 
		Sy += (double)arr_y[i]*overSig*overSig;	
	}
	return Sy; 
}

/* func: calc_ovr_sig_sqrd()
 *
 * This function adds up all of the inverse squared sigmas in the event array
 */
double calc_ovr_sig_sqrd(long arr_sig[], int size) {
	double S = 0;
	double sig, overSig;

	for(int i = 0; i < size; i++) {
		sig = (double)arr_sig[i];
		overSig = 1/sig; 
		//printf("calc_ovr_sig_sqrd() --> sig = %.6f\n", sig);
		//printf("calc_ovr_sig_sqrd() --> overSig = %.6f\n", overSig);
		S += overSig*overSig;	
	}
	return S; 
}

/* func: calc_chi_squared()
 *
 * This function calculates the goodness of fit from each of the parameters: 
 */
double calc_chi_squared(double a, double b, long arr_x[], long arr_y[], long arr_sig[], int size) {
	double temp = 0;
	double tempOverSig = 0;
	double tempOverSigSquared = 0;
	double gof = 0; // our goodness-of-fit
	double term1 = 1/((double) size - 2); // invoked after loop
	double term2 = 0; // adding tempOverSigSquared
	double x, y, sig, overSig;

	//for uncertainty calcs
	double t, S, Sx, SxoS, Sx2, Sy, Stt, oa2, ob2;
	S = calc_ovr_sig_sqrd(arr_sig, size);
	// printf("calc_chi_squared() --> S = %.6f\n", S);
	double oneOverS = 1/S;
	
	// Sx
	Sx = calc_ovr_sig_sqrd_x(arr_sig, size, arr_x);
	// printf("calc_chi_squared() --> Sx = %.6f\n", Sx);
	// Sy (not sure if i need this yet)
	// Sy = calc_ovr_sig_sqrd_y(arr_sig, size, arr_y);
	
	SxoS = Sx/S; // Sx over S
	Stt = 0; 
	Sx2 = Sx*Sx; // Sx^2

	//printf("<== Starting calc_chi_squared LOOP ==>\n");
	for(int i = 0; i < size; i++) {
		x = (double)arr_x[i]; // x_i
		y = (double)arr_y[i]; // y_i
		sig = (double)arr_sig[i]; // sig_i 
		overSig = 1/sig; // I need this here for t, but it's calculated again in calc_over_sig_sqrd


		// Calculate t_i
		t  = overSig * (x-SxoS); 
		
		Stt += t*t;

		temp = y - a - b*x;
		tempOverSig = temp*overSig;
		tempOverSigSquared = tempOverSig*tempOverSig; 
		
	        term2 += tempOverSigSquared;
				// Clear out temp values, jic	
		temp = 0;
		tempOverSig = 0; 
		tempOverSigSquared = 0;		
	}
	
	//uncertainty calcs
	oa2 = oneOverS*(1 + Sx2/(S*Stt));
        ob2 = 1/Stt;	

	printf("	uncertainty on a:  %.6f\n", oa2);
	printf("	uncertainty on b:  %.6f\n", ob2);
	
	gof = term1*term2; 
	
	return gof; 
}

/* func: calc_distance()
 *
 * This function calculates the distance `f(a,b)`
 */
double calc_distance(const double a, const double b, const long arr_x[], const long arr_y[]) {
	double f = 0; 	
	double temp = 0;
	double tempSquared = 0;
	
	double x, y, sig;

	//printf("<== Starting calc_distance LOOP ==>\n");
	for(int i = 0; i < tempN; i++) {
		x = (double) arr_x[i];
		y = (double) arr_y[i];

		temp = y - a - b*x;
		tempSquared = temp*temp;

		f += tempSquared;
		
		// Clear out temp values, jic	
		temp = 0;
		tempSquared = 0;
	}

	return f;
}

/* func: fit()
 * 
 * Takes in all relevant values and creates a fit for the set of points 
 * 	sigmas and lasts
 */ 
void fit(long arr_x[], long arr_y[], long arr_sig[], int size) { 
	
	//<-- initialize parameters --> 
	long sx, sy, sxy, sxx, sx2; // Sum x, y, xy, xx, and the square of sx
	long a1, b1, a2, b2; // best fit parameters	
	double a, b;
	a = 0.; 
	a1 = 0; 
	a2 = 0;

	b = 0.;	
	b1 = 0; 
	b2 = 0; 

	//<-- Call 'add_nums()' function -->
	add_nums(arr_x, arr_y, size, &sx, &sy, &sxy, &sxx); 
	sx2 = sx*sx; 		
	// <-- Parameter 'a' calc --> 	
	a1 = sy*sxx - sxy*sx;
	a2 = size*sxx - sx2; 	
	a = (double) a1/a2;

	// <-- Parameter 'b' calc --> 	
	b1 = size*sxy - sx*sy;
	b2 = size*sxx - sx2; 	
	b = (double) b1/b2;

	printf("fit() --> Best fit param a: %0.6f\n", a);	
	printf("fit() --> Best fit param b: %0.6f\n", b);	
	

	// <-- Call `calc_distance()` function --> 	
	double f = 0; // our distance
	f = calc_distance(a,b, arr_x, arr_y);
	
	// <-- Call `calc_chi_squared()` function --> 	
	double gof = 0; // our goodness of fit
	gof = calc_chi_squared(a,b, arr_x, arr_y, arr_sig, size);
	

	printf("fit() --> f(a,b) = %.9f\n",f);
	printf("fit() --> goodness of fit = %.9f\n",gof);

}


int main() {



	long *arr_x = NULL;
	long *arr_y = NULL;
	long *arr_sig = NULL;
	int arr_size = 0;
	int previous_i = 0; // good for accounting 
	int event_count = 0; 

	int j = 0;

	arr_x = (long *)malloc(tempN * sizeof(long));
	arr_y = (long *)malloc(tempN * sizeof(long));
	arr_sig = (long *)malloc(tempN * sizeof(long));


	for(int i = 0; i < tempN; i++) {
		arr_x[j] = (long)tempxs[i];
		arr_y[j] = (long)tempys[i];
		arr_sig[j] = (long)tempsigmas[i];
		j++;

		if(templasts[i] == 1) {
			printf("============ EVENT %d ============\n", event_count);
			// since arr_q changes over the course of the loop, 
			// 	we cant use iterator to obtain the size  
			arr_size = i - previous_i; // i will go up to tempN but the size will stay low 
			previous_i = i;
		
			fit(arr_x, arr_y, arr_sig, arr_size);

			// this will set all data in the arrays to 0	
			memset(arr_x, 0, arr_size * sizeof(long));
			memset(arr_y, 0, arr_size * sizeof(long));
			memset(arr_sig, 0, arr_size * sizeof(long));
			j = 0; // restart the index of the temp arr_qs
			printf("main() --> Current index %d of %d \n",i,tempN); 

			event_count+=1;
			arr_size = 0;
		}
	}

	// this frees up the allocated memory
	free(arr_x);
	free(arr_y);
	free(arr_sig);

	return 0;
}
