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

--- 

## Moving onto the tempQs in the header

Reminder that the parameters `a` and `b` need to be floats, which is fine and done by casing one of the operations as a float before the division operation, it will yield something like : 

```
[akraus@metis hw]$ ./main
Sum of x's: 66169
Sum of y's: 291102
Sum of yx's: 18194876
Sum of xx's: 4343909
--> a1: 454305530
--> a2: 1538067497
--> b1: 1224525578
--> b2: 1538067497
Best fit param a: 0.295374
Best fit param b: 0.796146
```
---
## Inputting `a` and `b` into `f(a,b)`

At this point, we can input `a & b` into the function `f(a,b)` and loop over all `x` and `y`'s 

The loop could be something like 

```C
float  f = 0;
float temp = 0; 
for(int i = 0; i < N; i++){ 
	temp = (float)ty[i] - a - b * (float)tx[i]; 
	f += temp*temp;
}
```
Which in the case of the current mode of operation, I calculated: `f(a,b) = 143088368.00000`, but this is strange because when I print out the first ten `temp` and temp-squared (`temp2`) terms they're both floats with decimal values.
After a couple dozen iterations, we start to see values with significantly less precision in the decimal spaces. 

I think this is because the `(float)` type is not precise enough.
So let's try using longs, then doubles if we need to... 
The `long` data type didnt work out very well, when calculating the best fit parameters, it would zero them out for some reason, not sure why. 

Using the `double` type worked though, lots more precision, with `f(a,b) = 143088469.544197172` which leads to a difference of `101.544197` (fun vim tool, in insert mode: `<ctrl-r> =` gives a calculator at the place of your cursor). 
 
> Question I have to answer: how is memory impacted? 
> Is there a better way to do this?

I'm not sure I'm on the right trail here. The goodness of fit ( chi^2/ndf ) though, should be around 1, so this might be a good check to see if my calculation for distance (`f(a,b)`) is on the right track.

One thing I'm unclear about is the degrees of freedom. 
In physics, I know the degrees of freedom to be the smallest number `n` parameters whose values need to be known to determine every other parameter of the system. 
[(Link)](https://en.wikipedia.org/wiki/Degrees_of_freedom_(physics_and_chemistry))
In statistics this is different, it seems like it could mean a couple different things  [(Link)](https://en.wikipedia.org/wiki/Degrees_of_freedom_(statistics)#:~:text=The%20effective%20degrees%20of%20freedom,residual%20effective%20degrees%20of%20freedom.) but in a goodness-of-fit test the degrees of freedom are (num of categories - 1) where the number of categories could just be the range of data you see to fit.    
