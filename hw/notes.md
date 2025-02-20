# Homework with HLS and fit functions

I'm going to start by writing the pseudocode that I think would need to be done for this project because this one seems a bit involved with HLS. 

This first approach is going to be the naive way to approach this problem, but we all start somewhere :)
 
## best fit params:
### define: N, sy, sxy, sx, sx2, sxx
```C
	int N = ?? // How many values? 1362?  
	
	// These are sums, so they need to be added up
	sx = add_sx(int x); 
	sy = add_sy(int y);  
	sxy = add_sxy(int x, int y); 
	
	// Useful to set sx^2 as its own variable to
	//	excess multiplication
	sx2 = sx*sx;
	
	a = ( sy * sxx - sxy * sx )/( N * sxx - sx2 ) 
	b = ( N * sxy - sx * sy )/(N * sxx - sx2 ) 
```

Where the functions add_sq(int q) go something like: 

```C
int add_sx(int x)   {
	int sum = 0;  
	// access the array of all x_i 
	for(int j = 0; j < array.size(); j++) { 
		sum += array[i];	
	} 
} 
```


