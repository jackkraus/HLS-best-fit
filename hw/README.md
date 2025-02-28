How the C code runs independently of HLS: 


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

> Thu Feb 27 15:54:07 CST 2025

After the first pass of synthesizing main() and simulating fit(), we're able to get some interesting answers: 

```bash
INFO: [SIM 2] *************** CSIM start ***************
INFO: [SIM 4] CSIM will launch GCC as the compiler.
   Compiling ../../../../main.cpp in debug mode
   Generating csim.exe
HLS_PRINT: ============ EVENT 0 ============
HLS_PRINT: <== Starting add_nums LOOP ==>
HLS_PRINT: fit() --> Best fit param a: 42.458060
HLS_PRINT: fit() --> Best fit param b: -0.562644
HLS_PRINT:      uncertainty on a:  0.195520
HLS_PRINT:      uncertainty on b:  0.000052
HLS_PRINT: fit() --> f(a,b) = 4251.664237980
HLS_PRINT: fit() --> goodness of fit = 2.160768368
HLS_PRINT: main() --> Current index 99
HLS_PRINT: ============ EVENT 1 ============
HLS_PRINT: <== Starting add_nums LOOP ==>
HLS_PRINT: fit() --> Best fit param a: 122.423997
HLS_PRINT: fit() --> Best fit param b: -3.395082
HLS_PRINT:      uncertainty on a:  0.237399
HLS_PRINT:      uncertainty on b:  0.000077
HLS_PRINT: fit() --> f(a,b) = 12564.154501385
HLS_PRINT: fit() --> goodness of fit = 22.238202857
HLS_PRINT: main() --> Current index 193
HLS_PRINT: ============ EVENT 2 ============
HLS_PRINT: <== Starting add_nums LOOP ==>
HLS_PRINT: fit() --> Best fit param a: 60.546292
HLS_PRINT: fit() --> Best fit param b: 1.105061
HLS_PRINT:      uncertainty on a:  0.399651
HLS_PRINT:      uncertainty on b:  0.000107
HLS_PRINT: fit() --> f(a,b) = 27479.613093595
HLS_PRINT: fit() --> goodness of fit = 1.022818726
HLS_PRINT: main() --> Current index 435
HLS_PRINT: ============ EVENT 3 ============
HLS_PRINT: <== Starting add_nums LOOP ==>
HLS_PRINT: fit() --> Best fit param a: 0.996648
HLS_PRINT: fit() --> Best fit param b: -1.288404
HLS_PRINT:      uncertainty on a:  0.079917
HLS_PRINT:      uncertainty on b:  0.000025
HLS_PRINT: fit() --> f(a,b) = 1630.467367770
HLS_PRINT: fit() --> goodness of fit = 0.995003847
HLS_PRINT: main() --> Current index 677
HLS_PRINT: ============ EVENT 4 ============
HLS_PRINT: <== Starting add_nums LOOP ==>
HLS_PRINT: fit() --> Best fit param a: 12.933075
HLS_PRINT: fit() --> Best fit param b: 10.981780
HLS_PRINT:      uncertainty on a:  10.512954
HLS_PRINT:      uncertainty on b:  0.003394
HLS_PRINT: fit() --> f(a,b) = 232264.209104891
HLS_PRINT: fit() --> goodness of fit = 0.949532678
HLS_PRINT: main() --> Current index 919
HLS_PRINT: ============ EVENT 5 ============
HLS_PRINT: <== Starting add_nums LOOP ==>
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

Everything but the `f(a,b)` is the same as before which is good. Going to investigate what's going on with that now. 
