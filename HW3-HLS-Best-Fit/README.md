# PHYS 790 HW3 - Event hit fitting with HLS 

> The `hw` directory is the project directory, from there `main.cpp` is the solution with top function `main()` that should run everything in Vitis correctly. 


What the `C` code runs (before transfer over to `C++`): 
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

After the `C++`ification 


### Script into HLS
How it runs in HLS without pragmas: 

![picture](https://github.com/jackkraus/HLS-best-fit/blob/main/img/Pasted%20image%2020250227152253.png)

When synthesizing `fit()` ![picture](https://github.com/jackkraus/HLS-best-fit/blob/main/img/Pasted%20image%2020250227164603.png) 

And running the simulation: 

```bash
INFO: [SIM 2] *************** CSIM start ***************
INFO: [SIM 4] CSIM will launch GCC as the compiler.
   Compiling ../../../../main.cpp in debug mode
   Generating csim.exe
HLS_PRINT: ============ EVENT 0 ============
HLS_PRINT: fit() --> Best fit param a: 42.458060
HLS_PRINT: fit() --> Best fit param b: -0.562644
HLS_PRINT:      uncertainty on a:  0.195520
HLS_PRINT:      uncertainty on b:  0.000052
HLS_PRINT: fit() --> f(a,b) = 4251.664237980
HLS_PRINT: fit() --> goodness of fit = 2.160768368
HLS_PRINT: main() --> Current index 99
HLS_PRINT: ============ EVENT 1 ============
HLS_PRINT: fit() --> Best fit param a: 122.423997
HLS_PRINT: fit() --> Best fit param b: -3.395082
HLS_PRINT:      uncertainty on a:  0.237399
HLS_PRINT:      uncertainty on b:  0.000077
HLS_PRINT: fit() --> f(a,b) = 12564.154501385
HLS_PRINT: fit() --> goodness of fit = 22.238202857
HLS_PRINT: main() --> Current index 193
HLS_PRINT: ============ EVENT 2 ============
HLS_PRINT: fit() --> Best fit param a: 60.546292
HLS_PRINT: fit() --> Best fit param b: 1.105061
HLS_PRINT:      uncertainty on a:  0.399651
HLS_PRINT:      uncertainty on b:  0.000107
HLS_PRINT: fit() --> f(a,b) = 27479.613093595
HLS_PRINT: fit() --> goodness of fit = 1.022818726
HLS_PRINT: main() --> Current index 435
HLS_PRINT: ============ EVENT 3 ============
HLS_PRINT: fit() --> Best fit param a: 0.996648
HLS_PRINT: fit() --> Best fit param b: -1.288404
HLS_PRINT:      uncertainty on a:  0.079917
HLS_PRINT:      uncertainty on b:  0.000025
HLS_PRINT: fit() --> f(a,b) = 1630.467367770
HLS_PRINT: fit() --> goodness of fit = 0.995003847
HLS_PRINT: main() --> Current index 677
HLS_PRINT: ============ EVENT 4 ============
HLS_PRINT: fit() --> Best fit param a: 12.933075
HLS_PRINT: fit() --> Best fit param b: 10.981780
HLS_PRINT:      uncertainty on a:  10.512954
HLS_PRINT:      uncertainty on b:  0.003394
HLS_PRINT: fit() --> f(a,b) = 232264.209104891
HLS_PRINT: fit() --> goodness of fit = 0.949532678
HLS_PRINT: main() --> Current index 919
HLS_PRINT: ============ EVENT 5 ============
HLS_PRINT: fit() --> Best fit param a: 6.695400
HLS_PRINT: fit() --> Best fit param b: 7.025747
HLS_PRINT:      uncertainty on a:  0.140837
HLS_PRINT:      uncertainty on b:  0.000045
HLS_PRINT: fit() --> f(a,b) = 284589.050477618
HLS_PRINT: fit() --> goodness of fit = 26.927211145
HLS_PRINT: main() --> Current index 1361
INFO: [SIM 1] CSim done with 0 errors.
INFO: [SIM 3] *************** CSIM finish ***************
                                               
```

### With Pragmas
The results are the same without pragmas, because the way it's currently setup, none of the PIPELINE or UNROLL pragmas invoked are being used because of some errors with the subloops not being unrolled (?-- I think that's the problem?)

Here are the performance stats with the current pragmas (`PIPELINE` and `UNROLL`)
![perf](https://github.com/jackkraus/HLS-best-fit/blob/main/img/Pasted%20image%2020250227225816.png)

Here are the scheduler warnings, this is what's telling me that the subloops not being unrolled disallows the pipeline directive to be enabled.
![36](https://github.com/jackkraus/HLS-best-fit/blob/main/img/Pasted%20image%2020250227225536.png)

An example function with the pragmas looks like the following, though the actual code is in `main.cpp`: 
```C++
#pragma HLS PIPELINE II=1
for(int i = 0; i < size; i++) {
		#pragma HLS UNROLL
		x = (double) arrx[i];
		y = (double) arry[i];
		temp = y - a - b*x;
		tempSquared = temp*temp;
		f += tempSquared;   
		temp = 0;
		tempSquared = 0;
}
```

Where the idea was to `PIPELINE` this for-loop and for the elements to be `UNROLL`ed. But I'm not sure that's how it was supposed to go. 

It could just be that there's too much going on in each for-loop that the overlap is ruining it's ability to parallelize the tasks without overstepping each other. In which case I'd probably try and create more functions to calculate `temp` since that's called multiple times. Or a function to assign `x` and `y` which could use the `UNROLL` pragma easier? 
