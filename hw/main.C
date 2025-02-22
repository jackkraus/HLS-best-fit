#include "main.h"
#include <ap_int.h>
#include <ap_fixed.h> // Using fixed-point arithmetic for resource optimization
#include <hls_stream.h>
#include <iostream>  // For debug prints
#include "hls_math.h"
#include <fstream>
#include <iomanip>
#include <cstring>
#include <string>
#include "fit.h"

using namespace std;

void fit( int *tempxs, int *tempys, int *tempsigmas, int *templasts, int tempN ) { 
	//init params
	int sx, sy, sxy, sx2; // Sum x, y, xy, and the square of sx
	int a, b; // best fit parameters
	
	sx = add_sx(tempxs);
	sy = add_sy(tempys); 
	sxy = add_sxy(tempxs, tempys); 
	
	sx2 = sx*sx; 

		
} 


int main() {
	fit(tempxs, tempys, tempsigmas, templasts, tempN);
	return 0;
}
