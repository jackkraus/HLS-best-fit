#include "main.h"
#include <stdio.h>  // For debug prints, originally iostream
#include <stdlib.h>
#include <string.h>

//#include <ap_int.h>
//#include <ap_fixed.h> // Using fixed-point arithmetic for resource optimization

/* func: add_nums()
 *
 * This function is only called once so we can init the sums and immediately 
 * 	start adding them together. 
 */

using namespace std; 

#ifdef __cplusplus   
extern "C" {
#endif
void add_nums(const long arrx[], const long arry[], int size, long* sx, long* sy, long* sxy, long* sxx){
	*sx = 0;
    	*sy = 0;
    	*sxy = 0;
	*sxx = 0;
	
	//hls::print("<== Starting add_nums LOOP ==>\n");	
	#pragma HLS PIPELINE II=1
	for(int i = 0; i < size; i++){
		#pragma HLS UNROLL factor=4
		*sx += arrx[i];
		*sy += arry[i];
		*sxy += arrx[i]*arry[i];
		*sxx += arrx[i]*arrx[i];
	}
}
#ifdef __cplusplus   
} 
#endif


/* func: calc_ovr_sig_sqrd_x()
 *
 * This function adds up all of the inverse squared sigmas in the event array
 * 	and multiplies it by the x's
 */
#ifdef __cplusplus   
extern "C" {
#endif

double calc_ovr_sig_sqrd_x(long arrsig[], int size, long arrx[]) {
	double Sx = 0;
	double sig, overSig;
	
	#pragma HLS PIPELINE
	for(int i = 0; i < size; i++) {
		#pragma HLS UNROLL factor=2
		sig = (double)arrsig[i];
		overSig = 1/sig; 
		Sx += (double)arrx[i]*overSig*overSig;	
	}
	return Sx; 
}
#ifdef __cplusplus   
} 
#endif

/* func: calc_ovr_sig_sqrd_y()
 *
 * This function adds up all of the inverse squared sigmas in the event array
 * 	and multiplies it by the y's
 */
#ifdef __cplusplus   
extern "C" {
#endif
double calc_ovr_sig_sqrd_y(long arrsig[], int size, long arry[]) {
	double Sy = 0;
	double sig, overSig;
	#pragma HLS PIPELINE II=1
	for(int i = 0; i < size; i++) {
		sig = (double)arrsig[i];
		overSig = 1/sig; 
		Sy += (double)arry[i]*overSig*overSig;	
	}
	return Sy; 
}
#ifdef __cplusplus   
} 
#endif



/* func: calc_ovr_sig_sqrd()
 *
 * This function adds up all of the inverse squared sigmas in the event array
 */
#ifdef __cplusplus   
extern "C" {
#endif
double calc_ovr_sig_sqrd(long arrsig[], int size) {
	double S = 0;
	double sig, overSig;
	#pragma HLS PIPELINE II=1
	for(int i = 0; i < size; i++) {
		sig = (double)arrsig[i];
		overSig = 1/sig; 
		//printf("calc_ovr_sig_sqrd() --> sig = %.6f\n", sig);
		//printf("calc_ovr_sig_sqrd() --> overSig = %.6f\n", overSig);
		S += overSig*overSig;	
	}
	return S; 
}

#ifdef __cplusplus   
} 
#endif


/* func: calc_chi_squared()
 *
 * This function calculates the goodness of fit from each of the parameters: 
 */
#ifdef __cplusplus   
extern "C" {
#endif
double calc_chi_squared(double a, double b, long arrx[], long arry[], long arrsig[], int size) {
	double temp = 0;
	double tempOverSig = 0;
	double tempOverSigSquared = 0;
	double gof = 0; // our goodness-of-fit
	double term1 = 1/((double) size - 2); // invoked after loop
	double term2 = 0; // adding tempOverSigSquared
	double x, y, sig, overSig;

	//for uncertainty calcs
	double t, S, Sx, SxoS, Sx2, Sy, Stt, oa2, ob2;
	S = calc_ovr_sig_sqrd(arrsig, size);
	// printf("calc_chi_squared() --> S = %.6f\n", S);
	double oneOverS = 1/S;
	
	// Sx
	Sx = calc_ovr_sig_sqrd_x(arrsig, size, arrx);
	// printf("calc_chi_squared() --> Sx = %.6f\n", Sx);
	// Sy (not sure if i need this yet)
	// Sy = calc_ovr_sig_sqrd_y(arrsig, size, arry);
	
	SxoS = Sx/S; // Sx over S
	Stt = 0; 
	Sx2 = Sx*Sx; // Sx^2

	//printf("<== Starting calc_chi_squared LOOP ==>\n");
	#pragma HLS PIPELINE
	for(int i = 0; i < size; i++) {
		#pragma HLS UNROLL
		x = (double)arrx[i]; // x_i
		y = (double)arry[i]; // y_i
		sig = (double)arrsig[i]; // sig_i 
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

	hls::print("	uncertainty on a:  %.6f\n", oa2);	
	hls::print("	uncertainty on b:  %.6f\n", ob2);	
	
	gof = term1*term2; 
	
	return gof; 
}

#ifdef __cplusplus   
} 
#endif


/* func: calc_distance()
 *
 * This function calculates the distance `f(a,b)`
 */
#ifdef __cplusplus   
extern "C" {
#endif
double calc_distance(const double a, const double b, const long arrx[], const long arry[], int size) {
	double f = 0; 	
	double temp = 0;
	double tempSquared = 0;
	
	double x, y, sig;

	//printf("<== Starting calc_distance LOOP ==>\n");
	
	#pragma HLS PIPELINE II=1
	for(int i = 0; i < size; i++) {
		#pragma HLS UNROLL
		x = (double) arrx[i];
		y = (double) arry[i];

		temp = y - a - b*x;
		tempSquared = temp*temp;

		//hls::print("calc_distance() --> x = %.9f\n",x);	
		//hls::print("calc_distance() --> y = %.9f\n",y);	
		//hls::print("calc_distance() --> temp = %.9f\n",temp);	
		//hls::print("calc_distance() --> tempSquared = %.9f\n",tempSquared);	
		f += tempSquared;
		
		// Clear out temp values, jic	
		temp = 0;
		tempSquared = 0;
	}

	//hls::print("calc_distance() --> f(a,b) = %.9f\n",f);	
	return f;
}

#ifdef __cplusplus   
} 
#endif

/* func: fit()
 * 
 * Takes in all relevant values and creates a fit for the set of points 
 * 	sigmas and lasts
 */ 
#ifdef __cplusplus   
extern "C" {
#endif

void fit(long *arrx, long *arry, long *arrsigs, int size) {
	
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
	add_nums(arrx, arry, size, &sx, &sy, &sxy, &sxx); 
	sx2 = sx*sx; 		
	// <-- Parameter 'a' calc --> 	
	a1 = sy*sxx - sxy*sx;
	a2 = size*sxx - sx2; 	
	a = (double) a1/a2;

	// <-- Parameter 'b' calc --> 	
	b1 = size*sxy - sx*sy;
	b2 = size*sxx - sx2; 	
	b = (double) b1/b2;

	
	hls::print("fit() --> Best fit param a: %0.6f\n", a);	
	hls::print("fit() --> Best fit param b: %0.6f\n", b);	

	// <-- Call `calc_distance()` function --> 	
	double f = 0; // our distance
	f = calc_distance(a,b, arrx, arry, size);
	
	// <-- Call `calc_chi_squared()` function --> 	
	double gof = 0; // our goodness of fit
	gof = calc_chi_squared(a,b, arrx, arry, arrsigs, size);
	

	hls::print("fit() --> f(a,b) = %.9f\n",f);	
	hls::print("fit() --> goodness of fit = %.9f\n",gof);	
}

#ifdef __cplusplus
} 
#endif


#ifdef __cplusplus   
extern "C" {
#endif

int main() {

	int MAX_SIZE = 1024;

	long arrx[MAX_SIZE];
	long arry[MAX_SIZE];
	long arrsig[MAX_SIZE];
	int arrsize = 0;
	int previous_i = 0; // good for accounting 
	int event_count = 0; 

	int j = 0;

	for(int i = 0; i < tempN; i++) {
		arrx[j] = (long)tempxs[i];
		arry[j] = (long)tempys[i];
		arrsig[j] = (long)tempsigmas[i];
		j++;

		if(templasts[i] == 1) {
			hls::print("============ EVENT %d ============\n", event_count);	
			arrsize = i - previous_i; // i will go up to tempN but the size will stay low 
			previous_i = i;
		
			fit(arrx, arry, arrsig, arrsize);

			// this will set all data in the arrays to 0	
			for (int k = 0; k < arrsize; k++) {
				#pragma HLS UNROLL
				arrx[k] = 0;
				arry[k] = 0;
				arrsig[k] = 0;
			}
			
			j = 0; // restart the index of the temp arrqs

			hls::print("main() --> Current index %d \n",i);
			event_count+=1;
			arrsize = 0;
		}
	}
	return 0;
}

#ifdef __cplusplus   
} 
#endif
