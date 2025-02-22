# Homework with HLS and fit functions

I'm going to start by writing the pseudocode that I think would need to be done for this project because this one seems a bit involved with HLS. 

This first approach is going to be the naive way to approach this problem, but we all start somewhere :)
 
## best fit params:
### define: N, sy, sxy, sx, sx2, sxx, a, and b
```C
SomeFunctionToCalculateParams(int tempN) { 
	
	// These are sums, so they need to be added up
	sx = add_sx(int x); 
	sy = add_sy(int y);  
	sxy = add_sxy(int x, int y); 
	
	// Useful to set sx^2 as its own variable to
	//	excess multiplication
	sx2 = sx*sx;
	
	a = ( sy * sxx - sxy * sx )/( N * sxx - sx2 ) 
	b = ( N * sxy - sx * sy )/(N * sxx - sx2 ) 
}
```

Where the functions add_sq(int q) go something like: 

TODO: One thing I need to make sure that the arrays are being accessed correctly by each function, and find out how we're actually going to access it? 
- access: pass in `*tempqs` into the function, which reference the address of the array (?) 
  
```C
int add_up_all(int array)   {

	int sum = 0; 
 
	// access the array of all x_i 
	for(int j = 0; j < array.size(); j++) { 
		sum += array[i];
	}
	
	return sum; 
} 
```


Issue with Feb22nd push : 

```
[akraus@metis hw]$ ./main
After INIT: sy=32766
Before LOOP: sx=-1008385448, sy=-1008385452, sxy=-1008385456
LOOP: sy=-1008385452
LOOP: sy=-1008385452
LOOP: sy=-1008385452
LOOP: sy=-1008385452
LOOP: sy=-1008385452
Sum of x's: 6, Expected: 6
Sum of y's: 32776, Expected: 10
Sum of yx's: 12, Expected: 12
```
