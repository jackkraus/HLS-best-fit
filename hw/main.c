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
int add_nums(const int *tempxs, const int *tempys, int tempN, int* sx, int* sy, int* sxy){
		
	*sx, *sy, *sxy = 0;
	printf("Before LOOP: sx=%d, sy=%d, sxy=%d\n", sx,sy,sxy);
	for(int i = 0; i < tempN; i++){
		*sx += tempxs[i];
		printf("LOOP: sy=%d\n",sy);
		*sy += tempys[i];
		*sxy += tempxs[i]*tempys[i];
	}
}



/* func: fit()
 * 
 * Takes in all relevant values and creates a fit for the set of points 
 * 	sigmas and lasts
 */ 
void fit( int *tempxs, int *tempys, int *tempsigmas, int *templasts, int tempN ) { 
	
	//init params
	int sx, sy, sxy, sx2; // Sum x, y, xy, and the square of sx
	int a, b; // best fit parameters	
		
	printf("After INIT: sy=%d\n",sy);
	add_nums(tempxs, tempys, tempN, &sx, &sy, &sxy); 
	sx2 = sx*sx; 		

	printf("Sum of x's: %d, Expected: 6\n", sx);
	printf("Sum of y's: %d, Expected: 10\n", sy);
	printf("Sum of yx's: %d, Expected: 12\n", sxy);
}

int main() {
	// Before I call this, I want to make sure my code does what I want it to
	//fit(tempxs, tempys, tempsigmas, templasts, tempN);
	int N = 5;
	int array1[] = {1,1,1,1,2};
	int array2[] = {2,2,2,2,2};
	int sigmas[] = {1,2,3,4,5};
       	int lasts[] = {0,0,0,1,0};	
        fit(array1, array2, sigmas, lasts, N);	
	return 0;
}
