#include "main.h"
//#include <ap_int.h>
//#include <ap_fixed.h> // Using fixed-point arithmetic for resource optimization
//#include <hls_stream.h>
#include <stdio.h>  // For debug prints, originally iostream
//#include "hls_math.h"
//#include <fstream>
//#include <iomanip>
//#include <cstring>
//#include <string>
//#include "fit.h"

//using namespace std;

/* func: add_nums()
 *
 * This function is only called once so we can init the sums and immediately 
 * 	start adding them together. 
 */
int add_nums(const int tempxs[], const int tempys[], int tempN, int* sx, int* sy, int* sxy, int* sxx){
		
	*sx = 0;
       	*sy = 0;
       	*sxy = 0;
	*sxx = 0;
	
	//printf("Before LOOP: sx=%d, sy=%d, sxy=%d, sxx%d\n", sx,sy,sxy, sxx);
	
	printf("<== Starting add_nums LOOP ==>\n");
	for(int i = 0; i < tempN; i++){
		*sx += tempxs[i];
		*sy += tempys[i];
		*sxy += tempxs[i]*tempys[i];
		*sxx += tempxs[i]*tempxs[i];
	}
}

/* func: calc_chi_squared()
 *
 * This function calculates the goodness of fit from each of the parameters: 
 */
double calc_chi_squared(const double a, const double b, const int tempxs[], const int tempys[], const int tempsigmas[]) {
	double temp = 0;
	double tempOverSig = 0;
	double tempOverSigSquared = 0;
	double gof = 0; // our goodness-of-fit
	double term1 = 1/((double)tempN - 2); // invoked after loop
	double term2 = 0; // adding tempOverSigSquared
	
	double x, y, sig;


	printf("<== Starting calc_chi_squared LOOP ==>\n");
	for(int i = 0; i < tempN; i++) {
		x = (double)tempxs[i];
		y = (double)tempys[i];
		sig = (double)tempsigmas[i];

		temp = y - a - b*x;
		tempOverSig = temp/sig;
		tempOverSigSquared = tempOverSig*tempOverSig; 
		
	        term2 += tempOverSigSquared;

		// For debugging precision of variables 
		// if(i<10) {
		// 	printf("i=%d ; tempOverSigSquared=%.6f\n",i,tempOverSigSquared);
		// 	printf("i=%d ; term2=%.6f\n",i,term2);
		// }
		
		// Clear out temp values, jic	
		temp = 0;
		tempOverSig = 0; 
		tempOverSigSquared = 0;		
	}
		
	printf("--> calc_chi_squared: term1 = %.9f\n",term1);
	printf("--> calc_chi_squared: term2 = %.9f\n",term2);
	gof = term1*term2; 
	
	printf("--> calc_chi_squared: gof = %.9f\n",gof);
	return gof; 
}

/* func: calc_distance()
 *
 * This function calculates the distance `f(a,b)`
 */
double calc_distance(const double a, const double b, const int tempxs[], const int tempys[]) {
	double f = 0; 	
	double temp = 0;
	double tempSquared = 0;
	
	double x, y, sig;

	printf("<== Starting calc_distance LOOP ==>\n");
	for(int i = 0; i < tempN; i++) {
		x = (double)tempxs[i];
		y = (double)tempys[i];

		temp = y - a - b*x;
		tempSquared = temp*temp;

		f += tempSquared;

		// For debugging precision of variables 
		// if(i<10) {
		// 	printf("i=%d ; temp=%.6f\n",i,temp);
		// 	printf("i=%d ; tempSquared=%.6f\n",i,tempSquared);
		// 	printf("i=%d ; f=%.6f\n",i,f);
		// }	
		
		// Clear out temp values, jic	
		temp = 0;
		tempSquared = 0;
	}

	printf("--> calc_distance: f(a,b) = %.9f\n",f);
	return f;
}

/* func: fit()
 * 
 * Takes in all relevant values and creates a fit for the set of points 
 * 	sigmas and lasts
 */ 
void fit( int tempxs[], int tempys[], int tempsigmas[], int templasts[], int tempN ) { 
	
	//<-- initialize parameters --> 
	int sx, sy, sxy, sxx, sx2; // Sum x, y, xy, xx, and the square of sx
	int a1, b1, a2, b2; // best fit parameters	
	double a, b;
	a = 0.; 
	a1 = 0; 
	a2 = 0;

	b = 0.;	
	b1 = 0; 
	b2 = 0; 

	//<-- Call 'add_nums()' function -->
	//printf("After INIT: sy=%d\n",sy);
	add_nums(tempxs, tempys, tempN, &sx, &sy, &sxy, &sxx); 
	sx2 = sx*sx; 		
	//printf("After add_nums: sx2=%d\n",sx2);
	
	//printf("Sum of x's: %d\n", sx);
	//printf("Sum of y's: %d\n", sy);
	//printf("Sum of yx's: %d\n", sxy);
	//printf("Sum of xx's: %d\n", sxx);

	// <-- Parameter 'a' calc --> 	
	a1 = sy*sxx - sxy*sx;
	a2 = tempN*sxx - sx2; 	
	printf("--> a1: %d\n", a1);	
	printf("--> a2: %d\n", a2);	
	a = (double) a1/a2;

	// <-- Parameter 'b' calc --> 	
	b1 = tempN*sxy - sx*sy;
	b2 = tempN*sxx - sx2; 	
	printf("--> b1: %d\n", b1);	
	printf("--> b2: %d\n", b2);	
	b = (double) b1/b2;

	printf("Best fit param a: %0.6f\n", a);	
	printf("Best fit param b: %0.6f\n", b);	
	

	// <-- Call `calc_distance()` function --> 	
	double f = 0; // our distance
	f = calc_distance(a,b, tempxs, tempys);
	
	// <-- Call `calc_chi_squared()` function --> 	
	double gof = 0; // our goodness of fit
	gof = calc_chi_squared(a,b, tempxs, tempys, tempsigmas);
	

	printf("f(a,b) = %.9f\n",f);
	printf("goodness of fit = %.9f\n",gof);

}

int main() {
	
	// Test parameters
	//int N = 5;
	//int array1[] = {1,1,1,1,2};
	//int array2[] = {2,2,2,2,2};
	//int sigmas[] = {1,2,3,4,5};
       	//int lasts[] = {0,0,0,1,0};	  
	//fit(array1, array2, sigmas, lasts, N);	
	

	//Eventually we'll have multiple events, instances where there's a set of x's and y's
	//	- The way to distinguish an event from another is by the 'last' value. 
	//		If the last value == 1, then that's the last x,y, and sigma for that event
	//			So implement a check
	//	- I have to create new arrays that take in the temp arguments and create new arrays 
	//		by which it can then send in for the fit function
	
	fit(tempxs, tempys, tempsigmas, templasts, tempN);
	
	return 0;
}
