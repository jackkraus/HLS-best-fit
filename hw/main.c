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
	for(int i = 0; i < tempN; i++){
		*sx += tempxs[i];
		*sy += tempys[i];
		*sxy += tempxs[i]*tempys[i];
		*sxx += tempxs[i]*tempxs[i];
	}
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

	printf("============================\n");	
	printf("===========ADDING===========\n");	
	printf("============================\n");	


	//<-- Call 'add_nums()' function -->
	//printf("After INIT: sy=%d\n",sy);
	add_nums(tempxs, tempys, tempN, &sx, &sy, &sxy, &sxx); 
	sx2 = sx*sx; 		
	//printf("After add_nums: sx2=%d\n",sx2);
	
	printf("Sum of x's: %d\n", sx);
	printf("Sum of y's: %d\n", sy);
	printf("Sum of yx's: %d\n", sxy);
	printf("Sum of xx's: %d\n", sxx);

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
	
	printf("============================\n");	
	printf("===========FITTING==========\n");	
	printf("============================\n");	

	double f = 0; 
	double temp = 0;
	double x, y;
	for(int i = 0; i < tempN; i++) {
		x = (double)tempxs[i];
		y = (double)tempys[i];

		temp = y - a - b*x;
	
		f += temp*temp;
		
		// For debugging precision of variables 
		//if(i<10) {
		//	printf("i=%d ; temp=%.6f\n",i,temp);
		//	printf("i=%d ; f=%.6f\n",i,f);
		//}
		
		temp = 0;		
	}

	printf("f(a,b) = %.9f\n",f);

	printf("============================\n");	
	printf("===========GoF Calc=========\n");	
	printf("============================\n");	


}

int main() {
	
	// Test parameters
	//int N = 5;
	//int array1[] = {1,1,1,1,2};
	//int array2[] = {2,2,2,2,2};
	//int sigmas[] = {1,2,3,4,5};
       	//int lasts[] = {0,0,0,1,0};	  
	//fit(array1, array2, sigmas, lasts, N);	
	
	
	fit(tempxs, tempys, tempsigmas, templasts, tempN);
	
	return 0;
}
