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



## Trial function: 

Here I want to just try adding numbers from two arrays: 

```C
	// Test parameters
	int N = 5;
	int array1[] = {1,1,1,1,2};
	int array2[] = {2,2,2,2,2};
	add_nums(array1, array2, N);
```

Where the `add_nums()` function uses the loop like: 
```C

for(int i = 0; i < N; i++){
	*sum1 += array1[i];
	*sum2 += array2[i];
	*sum12 += array1[i]*array2[i];
}
``` 

Issue with Feb22nd push : 

```bash
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

Solution with Feb 22nd push: 
```bash
[akraus@metis hw]$ ./main
After INIT: sy=32767
Before LOOP: sx=-1418001816, sy=-1418001820, sxy=-1418001824
LOOP: sy=-1418001820
LOOP: sy=-1418001820
LOOP: sy=-1418001820
LOOP: sy=-1418001820
LOOP: sy=-1418001820
Sum of x's: 6, Expected: 6
Sum of y's: 10, Expected: 10
Sum of yx's: 12, Expected: 12
```
When the variable isn't initialized with any value it's going to save the value with the previously saved one at that address.
Another thing I learned is the definition 
```C
	*sx, *sy, *sxy = 0;
``` 
is not allowed, instead we need an explicit definition: 
```C
	*sx = 0;
       	*sy = 0;
       	*sxy = 0;
```
Then the output will yield: 
```bash
After INIT: sy=32767
Before LOOP: sx=-1418001816, sy=-1418001820, sxy=-1418001824
LOOP: sy=-1418001820
LOOP: sy=-1418001820
LOOP: sy=-1418001820
LOOP: sy=-1418001820
LOOP: sy=-1418001820
Sum of x's: 6, Expected: 6
Sum of y's: 10, Expected: 10
Sum of yx's: 12, Expected: 12
```
