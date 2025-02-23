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
	float a, b;
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
	
	printf("Sum of x's: %d\n", sx);
	printf("Sum of y's: %d\n", sy);
	printf("Sum of yx's: %d\n", sxy);
	printf("Sum of xx's: %d\n", sxx);

	// <-- Parameter 'a' calc --> 	
	a1 = sy*sxx - sxy*sx;
	a2 = tempN*sxx - sx2; 	
	printf("--> a1: %d\n", a1);	
	printf("--> a2: %d\n", a2);	
	a = (float) a1/a2;

	// <-- Parameter 'b' calc --> 	
	b1 = tempN*sxy - sx*sy;
	b2 = tempN*sxx - sx2; 	
	printf("--> b1: %d\n", b1);	
	printf("--> b2: %d\n", b2);	
	b = (float) b1/b2;

	printf("Best fit param a: %0.6f\n", a);	
	printf("Best fit param b: %0.6f\n", b);	

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
