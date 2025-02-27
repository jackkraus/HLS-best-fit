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

I'm going to start by using `n = tempN` to see how it goes... The result `goodness of fit = 3461.308115350`, with the resulting values: 
```bash
term1 = 0.000735294
term2 = 4710840.344991086
f(a,b) = 143088469.544197172
goodness of fit = 3463.853194846
```
This tells me there's something wrong with the way I'm going about this. 
And there is: I've been ignoring the last values--where I need to use those to identify when the last coordinate for the event is. Instead I've been looking though the values of ALL events and trying to fit to that. 

It should be just a minor check to see if the last value is `1`, and if it is then I need to make sure it doesn't go on counting...

I have to take a more naive approach first before I do any optimization, because I'm sure there's better ways (oneof which might be to just loop through the data first, log the positions of all the lasts into its own array and use that array to loop over and fit each of the set of data)

I think what I'll do first is create a `very_temp_array_q` or `arr_q`whose job it is to hold onto every parameter q, do the fit with those `arr_q`s and then delete reset itself if the [templasts[i] == 1] otherwise keep going.
Might look something like: 

```C
int arr_x[];
int arr_y[];
int arr_sig[];
int arr_size;

for(int i = 0; i < tempN; i++) { // Loops over all values
	arr_x[i] = tempxs[i];
	arr_y[i] = tempys[i];
	arr_sig[i] = tempsigmas[i];
	
	// If last == true, then fit that array.
	if(templasts[i] == 1) {
		arr_size = sizeof(arr_x)/sizeof(arr_x[0]); 
		fit(arr_x, arr_y, arr_sig, arr_size);
		
		// After fit has been printed off, reset the temp arrays
		arr_x[] = {};
		arr_y[] = {};
		arr_sig[] = {};
		arr_size = 0;
	} 
	
} 
```

This actually caused some weird `-nan` and `inf` results when it comes to the fit and gof values. Not sure what's going on but I put the logs in `logs/mainlog` 


> Wed Feb 26 12:23:16 CST 2025

Okay, so I was able to actually implement something that creates a new array per event, the results look like 

```
============ EVENT 0 ============
fit() --> f(a,b) = 2280685.506037655
fit() --> goodness of fit = 2.204806498
main() --> Current index 99 of 1362
============ EVENT 1 ============
fit() --> f(a,b) = 17182241.715187974
fit() --> goodness of fit = inf
main() --> Current index 193 of 1362
...
```
and the rest of the goodness of fit calculations are infinite. 

That's not good so I need to fix it.

> Wed Feb 26 12:37:44 CST 2025

So after the first loop is complete, for some reason, the sig value at the end of the array is set to 0. it's not getting the proper value.

> Wed Feb 26 13:47:20 CST 2025

Okay I had some weird errors, but I got it, here are the results: 

```
============ EVENT 0 ============
fit() --> Best fit param a: 42.458060
fit() --> Best fit param b: -0.562644
fit() --> f(a,b) = 2279297.070794334
fit() --> goodness of fit = 2.160768368
main() --> Current index 99 of 1362 
============ EVENT 1 ============
fit() --> Best fit param a: 122.423997
fit() --> Best fit param b: -3.395082
fit() --> f(a,b) = 19016158.248631567
fit() --> goodness of fit = 22.238202857
main() --> Current index 193 of 1362 
============ EVENT 2 ============
fit() --> Best fit param a: 60.546292
fit() --> Best fit param b: 1.105061
fit() --> f(a,b) = 4133235.541930413
fit() --> goodness of fit = 1.022818726
main() --> Current index 435 of 1362 
============ EVENT 3 ============
fit() --> Best fit param a: 0.996648
fit() --> Best fit param b: -1.288404
fit() --> f(a,b) = 2742.970751940
fit() --> goodness of fit = 0.995003847
main() --> Current index 677 of 1362 
============ EVENT 4 ============
fit() --> Best fit param a: 12.933075
fit() --> Best fit param b: 10.981780
fit() --> f(a,b) = 419600.369175848
fit() --> goodness of fit = 0.949532678
main() --> Current index 919 of 1362 
============ EVENT 5 ============
fit() --> Best fit param a: 6.695400
fit() --> Best fit param b: 7.025747
fit() --> f(a,b) = 325831.159720024
fit() --> goodness of fit = 26.927211145
main() --> Current index 1361 of 1362 
```

I now have to clean up the code a little bit and include the uncertainty on the parameters.

  
> Wed Feb 26 15:02:53 CST 2025

Okay here's the results for the data in the header file: 

```
============ EVENT 0 ============
fit() --> Best fit param a: 42.458060
fit() --> Best fit param b: -0.562644
        uncertainty on a:  0.195520
        uncertainty on b:  0.000052
fit() --> f(a,b) = 2279297.070794334
fit() --> goodness of fit = 2.160768368
main() --> Current index 99 of 1362
============ EVENT 1 ============
fit() --> Best fit param a: 122.423997
fit() --> Best fit param b: -3.395082
        uncertainty on a:  0.237399
        uncertainty on b:  0.000077
fit() --> f(a,b) = 19016158.248631567
fit() --> goodness of fit = 22.238202857
main() --> Current index 193 of 1362
============ EVENT 2 ============
fit() --> Best fit param a: 60.546292
fit() --> Best fit param b: 1.105061
        uncertainty on a:  0.399651
        uncertainty on b:  0.000107
fit() --> f(a,b) = 4133235.541930413
fit() --> goodness of fit = 1.022818726
main() --> Current index 435 of 1362
============ EVENT 3 ============
fit() --> Best fit param a: 0.996648
fit() --> Best fit param b: -1.288404
        uncertainty on a:  0.079917
        uncertainty on b:  0.000025
fit() --> f(a,b) = 2742.970751940
fit() --> goodness of fit = 0.995003847
main() --> Current index 677 of 1362
============ EVENT 4 ============
fit() --> Best fit param a: 12.933075
fit() --> Best fit param b: 10.981780
        uncertainty on a:  10.512954
        uncertainty on b:  0.003394
fit() --> f(a,b) = 419600.369175848
fit() --> goodness of fit = 0.949532678
main() --> Current index 919 of 1362
============ EVENT 5 ============
fit() --> Best fit param a: 6.695400
fit() --> Best fit param b: 7.025747
        uncertainty on a:  0.140837
        uncertainty on b:  0.000045
fit() --> f(a,b) = 325831.159720024
fit() --> goodness of fit = 26.927211145
main() --> Current index 1361 of 1362
```
