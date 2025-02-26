#include "main.h"
//#include <ap_int.h>
//#include <ap_fixed.h> // Using fixed-point arithmetic for resource optimization
//#include <hls_stream.h>
#include <stdio.h>  // For debug prints, originally iostream
#include <stdlib.h>
#include <string.h>
//#include "hls_math.h"
//#include <fstream>
//#include <iomanip>
//#include <cstring>
//#include "fit.h"

//using namespace std;

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
	
	printf("add_nums() --> Before LOOP: sx=%d, sy=%d, sxy=%d, sxx%d\n", *sx, *sy, *sxy, *sxx);
	
	//printf("<== Starting add_nums LOOP ==>\n");
	for(int i = 0; i < size; i++){
		*sx += arr_x[i];
		*sy += arr_y[i];
		printf("addnums() --> i = %d, arr_y[i] = %d, sy == %d\n", i,arr_y[i], *sy); 
		*sxy += arr_x[i]*arr_y[i];
		*sxx += arr_x[i]*arr_x[i];
	}
	
	printf("fit() --> Sum of x's: %d\n", *sx);
	printf("fit() --> Sum of y's: %d\n", *sy);
	printf("fit() --> Sum of yx's: %d\n", *sxy);
	printf("fit() --> Sum of xx's: %d\n", *sxx);


}

/* func: calc_chi_squared()
 *
 * This function calculates the goodness of fit from each of the parameters: 
 */
double calc_chi_squared(const double a, const double b, const long arr_x[], const long arr_y[], const long arr_sig[], int size) {
	double temp = 0;
	double tempOverSig = 0;
	double tempOverSigSquared = 0;
	double gof = 0; // our goodness-of-fit
	double term1 = 1/((double) size - 2); // invoked after loop
	double term2 = 0; // adding tempOverSigSquared
	
	double x, y, sig;


	//printf("<== Starting calc_chi_squared LOOP ==>\n");
	for(int i = 0; i < size; i++) {
		x = (double)arr_x[i];
		y = (double)arr_y[i];
		sig = (double)arr_sig[i];

		temp = y - a - b*x;
		tempOverSig = temp/sig;
		tempOverSigSquared = tempOverSig*tempOverSig; 
		
	        term2 += tempOverSigSquared;

		 // For debugging precision of variables 
		 if(i<3) {
		 	printf("calc_chi_squared() --> i = %d ; tempOverSigSquared=%.6f\n",i,tempOverSigSquared);
		 	printf("calc_chi_squared() --> i = %d ; term2=%.6f\n",i,term2);
		 }
		
		// Clear out temp values, jic	
		temp = 0;
		tempOverSig = 0; 
		tempOverSigSquared = 0;		
	}
		
	printf(" calc_chi_squared() -->  term1 = %.9f\n",term1);
	printf(" calc_chi_squared() -->  term2 = %.9f\n",term2);
	gof = term1*term2; 
	
	printf("calc_chi_squared() --> gof = %.9f\n",gof);
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

		// For debugging precision of variables 
		if(i<3) {
		 	printf("calc_distance() --> i=%d ; temp=%.6f\n",i,temp);
		 	printf("calc_distance() --> i=%d ; tempSquared=%.6f\n",i,tempSquared);
		 	printf("calc_distance() --> i=%d ; f=%.6f\n",i,f);
		 }	
		
		// Clear out temp values, jic	
		temp = 0;
		tempSquared = 0;
	}

	printf("calc_distance() -->  f(a,b) = %.9f\n",f);
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
	printf("fit() --> After INIT: sy=%d\n",sy);
	add_nums(arr_x, arr_y, size, &sx, &sy, &sxy, &sxx); 
	sx2 = sx*sx; 		
	printf("fit() --> After add_nums: sx2=%d\n",sx2);	
	printf("fit() --> Sum of x's: %d\n", sx);
	printf("fit() --> Sum of y's: %d\n", sy);
	printf("fit() --> Sum of yx's: %d\n", sxy);
	printf("fit() --> Sum of xx's: %d\n", sxx);

	// <-- Parameter 'a' calc --> 	
	a1 = sy*sxx - sxy*sx;
	a2 = size*sxx - sx2; 	
	printf("fit() --> a1: %d\n", a1);
	printf("fit() --> a2: %d\n", a2);
	a = (double) a1/a2;

	// <-- Parameter 'b' calc --> 	
	b1 = size*sxy - sx*sy;
	b2 = size*sxx - sx2; 	
	printf("fit() --> b1: %d\n", b1);	
	printf("fit() --> b2: %d\n", b2);	
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
	
	//Eventually we'll have multiple events, instances where there's a set of x's and y's
	//	- The way to distinguish an event from another is by the 'last' value. 
	//		If the last value == 1, then that's the last x,y, and sigma for that event
	//			So implement a check
	//	- I have to create new arrays that take in the temp arguments and create new arrays 
	//		by which it can then send in for the fit function
	
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
		//printf("main() --> arr_y[i] = %d\n",arr_y[i]); 	

		if(templasts[i] == 1) {
			printf("============ EVENT %d ============\n", event_count);

			// since arr_q changes over the course of the loop, 
			// 	we cant use iterator to obtain the size  
			arr_size = i - previous_i + 1; // i will go up to tempN but the size will stay low 
			previous_i = i;
			
			// printf("main() --> i == %d\n", i); 
			// printf("main() --> arr_size == %d\n", arr_size); 
			// printf("main() --> arr_x[i-2] == %d\n", arr_x[i-2]);
			// printf("main() --> arr_y[i-2] == %d\n", arr_y[i-2]); // these have data in them
			
			fit(arr_x, arr_y, arr_sig, arr_size);
		//	printf("main() --> fit for EVT %d complete\n", event_count);

			// this will set all data in the arrays to 0	
			memset(arr_x, 0, arr_size * sizeof(long));
			memset(arr_y, 0, arr_size * sizeof(long));
			memset(arr_sig, 0, arr_size * sizeof(long));
			j = 0; // restart the index of the temp arr_qs

			// This is to check whether arr_y has actually been reset	
			// for(int k = 0;  k < arr_size; k++) {
			// 	printf("main() --> reset arr_y[j] = %d\n",arr_y[j]); 	
			// }
			
			printf("main() --> Current index %d of %d \n",i,tempN); 

			event_count+=1;
			arr_size = 0;
		}
	}

	// this frees up the allocated memory
	free(arr_x);
	free(arr_y);
	free(arr_sig);

	//fit(tempxs, tempys, tempsigmas, templasts, tempN);
	
	return 0;
}
