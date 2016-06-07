# Functions, Loops, and the Apply Family

# Functions

```
your_function_name <- function() {
    # stuff your function does
}
```


```r
my_function <- function(){
    print("Hello World")
}
```


```r
my_function()
```

```
## [1] "Hello World"
```


```r
my_square <- function(some_number){
    print(some_number)
}
```


```r
# will return an error because i didn't pass in a value
my_square()
```


```r
# will just print the value
my_square(3)
```

```
## [1] 3
```


```r
# rewrite the function to actually calculate a square
my_square <- function(some_number){
    some_number ** 2
}
my_square(4)
```

```
## [1] 16
```


```r
my_square <- function(some_number){
    # by default R funcitons will return the last thing it caluclated
    return(some_number ** 2)
}
```


```r
my_square(4)
```

```
## [1] 16
```


```r
my_number_squared <- my_square(4)
my_number_squared
```

```
## [1] 16
```


```r
my_adder <- function(thing1, thing2){
    return(thing1 + thing2)
}
my_adder(4, 2)
```

```
## [1] 6
```


```r
my_adder_defualt <- function(thing1, thing2=10){
    return(thing1 + thing2)
}
```


```r
my_adder_defualt(1)
```

```
## [1] 11
```


```r
my_adder_defualt(10, 15)
```

```
## [1] 25
```


```r
my_adder_defualt(thing1 = 10, thing2 = 15)
```

```
## [1] 25
```


```r
my_adder_defualt(thing2 = 15, thing1 = 10)
```

```
## [1] 25
```



```r
f_k <- function(temp){
    return((temp - 32) * (5 / 9) + 273.15)
}

k_c <- function(temp){
    return(temp - 273.15)
}

f_c <- function(temp){
    temp_k <- f_k(temp)
    result <- k_c(temp_k)
    return(result)
}
```


```r
k_c(f_k(32))
```

```
## [1] 0
```


# Apply Family

## Apply

```r
mtcars
```

```
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
```


```r
class(mtcars)
```

```
## [1] "data.frame"
```


```r
apply(X = mtcars, MARGIN = 2, FUN = sum)
```

```
##      mpg      cyl     disp       hp     drat       wt     qsec       vs 
##  642.900  198.000 7383.100 4694.000  115.090  102.952  571.160   14.000 
##       am     gear     carb 
##   13.000  118.000   90.000
```


```r
applied_sum <- apply(X = mtcars, MARGIN = 2, FUN = sum, na.rm = TRUE)
class(applied_sum)
```

```
## [1] "numeric"
```


```r
apply(X = mtcars, MARGIN = 1, FUN = sum)
```

```
##           Mazda RX4       Mazda RX4 Wag          Datsun 710 
##             328.980             329.795             259.580 
##      Hornet 4 Drive   Hornet Sportabout             Valiant 
##             426.135             590.310             385.540 
##          Duster 360           Merc 240D            Merc 230 
##             656.920             270.980             299.570 
##            Merc 280           Merc 280C          Merc 450SE 
##             350.460             349.660             510.740 
##          Merc 450SL         Merc 450SLC  Cadillac Fleetwood 
##             511.500             509.850             728.560 
## Lincoln Continental   Chrysler Imperial            Fiat 128 
##             726.644             725.695             213.850 
##         Honda Civic      Toyota Corolla       Toyota Corona 
##             195.165             206.955             273.775 
##    Dodge Challenger         AMC Javelin          Camaro Z28 
##             519.650             506.085             646.280 
##    Pontiac Firebird           Fiat X1-9       Porsche 914-2 
##             631.175             208.215             272.570 
##        Lotus Europa      Ford Pantera L        Ferrari Dino 
##             273.683             670.690             379.590 
##       Maserati Bora          Volvo 142E 
##             694.710             288.890
```


```r
apply(mtcars, 1, sum)
```

```
##           Mazda RX4       Mazda RX4 Wag          Datsun 710 
##             328.980             329.795             259.580 
##      Hornet 4 Drive   Hornet Sportabout             Valiant 
##             426.135             590.310             385.540 
##          Duster 360           Merc 240D            Merc 230 
##             656.920             270.980             299.570 
##            Merc 280           Merc 280C          Merc 450SE 
##             350.460             349.660             510.740 
##          Merc 450SL         Merc 450SLC  Cadillac Fleetwood 
##             511.500             509.850             728.560 
## Lincoln Continental   Chrysler Imperial            Fiat 128 
##             726.644             725.695             213.850 
##         Honda Civic      Toyota Corolla       Toyota Corona 
##             195.165             206.955             273.775 
##    Dodge Challenger         AMC Javelin          Camaro Z28 
##             519.650             506.085             646.280 
##    Pontiac Firebird           Fiat X1-9       Porsche 914-2 
##             631.175             208.215             272.570 
##        Lotus Europa      Ford Pantera L        Ferrari Dino 
##             273.683             670.690             379.590 
##       Maserati Bora          Volvo 142E 
##             694.710             288.890
```


```r
messedup_mtcars <- mtcars
messedup_mtcars$mpg_cyl <- messedup_mtcars$mpg + messedup_mtcars$cyl
```


```r
#' calculate the mpg + cyl
#' for each row of mtcars
my_calculation <- function(x){
    print(x)
    print(class(x))
    mpg_value <- x['mpg']
    cyl_value <- x[2]
    return(mpg_value + cyl_value)
}
```



```r
messedup_mtcars$appled_function <- apply(X = messedup_mtcars,
                                         MARGIN = 1,
                                         FUN = my_calculation)
```

```
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   21.00    6.00  160.00  110.00    3.90    2.62   16.46    0.00    1.00 
##    gear    carb mpg_cyl 
##    4.00    4.00   27.00 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  21.000   6.000 160.000 110.000   3.900   2.875  17.020   0.000   1.000 
##    gear    carb mpg_cyl 
##   4.000   4.000  27.000 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   22.80    4.00  108.00   93.00    3.85    2.32   18.61    1.00    1.00 
##    gear    carb mpg_cyl 
##    4.00    1.00   26.80 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  21.400   6.000 258.000 110.000   3.080   3.215  19.440   1.000   0.000 
##    gear    carb mpg_cyl 
##   3.000   1.000  27.400 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   18.70    8.00  360.00  175.00    3.15    3.44   17.02    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    2.00   26.70 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   18.10    6.00  225.00  105.00    2.76    3.46   20.22    1.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    1.00   24.10 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   14.30    8.00  360.00  245.00    3.21    3.57   15.84    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    4.00   22.30 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   24.40    4.00  146.70   62.00    3.69    3.19   20.00    1.00    0.00 
##    gear    carb mpg_cyl 
##    4.00    2.00   28.40 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   22.80    4.00  140.80   95.00    3.92    3.15   22.90    1.00    0.00 
##    gear    carb mpg_cyl 
##    4.00    2.00   26.80 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   19.20    6.00  167.60  123.00    3.92    3.44   18.30    1.00    0.00 
##    gear    carb mpg_cyl 
##    4.00    4.00   25.20 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   17.80    6.00  167.60  123.00    3.92    3.44   18.90    1.00    0.00 
##    gear    carb mpg_cyl 
##    4.00    4.00   23.80 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   16.40    8.00  275.80  180.00    3.07    4.07   17.40    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    3.00   24.40 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   17.30    8.00  275.80  180.00    3.07    3.73   17.60    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    3.00   25.30 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   15.20    8.00  275.80  180.00    3.07    3.78   18.00    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    3.00   23.20 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   10.40    8.00  472.00  205.00    2.93    5.25   17.98    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    4.00   18.40 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  10.400   8.000 460.000 215.000   3.000   5.424  17.820   0.000   0.000 
##    gear    carb mpg_cyl 
##   3.000   4.000  18.400 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  14.700   8.000 440.000 230.000   3.230   5.345  17.420   0.000   0.000 
##    gear    carb mpg_cyl 
##   3.000   4.000  22.700 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   32.40    4.00   78.70   66.00    4.08    2.20   19.47    1.00    1.00 
##    gear    carb mpg_cyl 
##    4.00    1.00   36.40 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  30.400   4.000  75.700  52.000   4.930   1.615  18.520   1.000   1.000 
##    gear    carb mpg_cyl 
##   4.000   2.000  34.400 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  33.900   4.000  71.100  65.000   4.220   1.835  19.900   1.000   1.000 
##    gear    carb mpg_cyl 
##   4.000   1.000  37.900 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  21.500   4.000 120.100  97.000   3.700   2.465  20.010   1.000   0.000 
##    gear    carb mpg_cyl 
##   3.000   1.000  25.500 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   15.50    8.00  318.00  150.00    2.76    3.52   16.87    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    2.00   23.50 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  15.200   8.000 304.000 150.000   3.150   3.435  17.300   0.000   0.000 
##    gear    carb mpg_cyl 
##   3.000   2.000  23.200 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   13.30    8.00  350.00  245.00    3.73    3.84   15.41    0.00    0.00 
##    gear    carb mpg_cyl 
##    3.00    4.00   21.30 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  19.200   8.000 400.000 175.000   3.080   3.845  17.050   0.000   0.000 
##    gear    carb mpg_cyl 
##   3.000   2.000  27.200 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  27.300   4.000  79.000  66.000   4.080   1.935  18.900   1.000   1.000 
##    gear    carb mpg_cyl 
##   4.000   1.000  31.300 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   26.00    4.00  120.30   91.00    4.43    2.14   16.70    0.00    1.00 
##    gear    carb mpg_cyl 
##    5.00    2.00   30.00 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##  30.400   4.000  95.100 113.000   3.770   1.513  16.900   1.000   1.000 
##    gear    carb mpg_cyl 
##   5.000   2.000  34.400 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   15.80    8.00  351.00  264.00    4.22    3.17   14.50    0.00    1.00 
##    gear    carb mpg_cyl 
##    5.00    4.00   23.80 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   19.70    6.00  145.00  175.00    3.62    2.77   15.50    0.00    1.00 
##    gear    carb mpg_cyl 
##    5.00    6.00   25.70 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   15.00    8.00  301.00  335.00    3.54    3.57   14.60    0.00    1.00 
##    gear    carb mpg_cyl 
##    5.00    8.00   23.00 
## [1] "numeric"
##     mpg     cyl    disp      hp    drat      wt    qsec      vs      am 
##   21.40    4.00  121.00  109.00    4.11    2.78   18.60    1.00    1.00 
##    gear    carb mpg_cyl 
##    4.00    2.00   25.40 
## [1] "numeric"
```

## sapply lapply

### lapply


```r
numbers <- c(1, 2, 3, 4, 5)
class(numbers)
```

```
## [1] "numeric"
```


```r
l <- lapply(X = numbers, FUN = my_adder_defualt)
```

```r
class(l)
```

```
## [1] "list"
```


```r
l[1]
```

```
## [[1]]
## [1] 11
```


```r
class(l[1])
```

```
## [1] "list"
```



```r
l[[1]]
```

```
## [1] 11
```


```r
class(l[[1]])
```

```
## [1] "numeric"
```


```r
sapply(X = numbers, FUN = my_adder_defualt)
```

```
## [1] 11 12 13 14 15
```


```r
l <- lapply(X = mtcars[, c('mpg', 'cyl')], FUN = class)
l[[1]]
```

```
## [1] "numeric"
```

# Loops

```
for(temp_variable in some_sequence){
    do something
}
```


```r
for(number in c(1, 2, 3)){
    print(number)
}
```

```
## [1] 1
## [1] 2
## [1] 3
```


```r
for(number in c(1, 2, 3)){
    print(my_adder_defualt(number))
}
```

```
## [1] 11
## [1] 12
## [1] 13
```

# parallelization


```r
library(foreach)
```


```r
foreach(i = 1:3) %do% {
    my_adder_defualt(i)
}
```

```
## [[1]]
## [1] 11
## 
## [[2]]
## [1] 12
## 
## [[3]]
## [1] 13
```


```r
foreach_loop_results <- foreach(i = 1:3) %do% {
    return(my_adder_defualt(i))
}
```


```r
foreach_loop_results
```

```
## [[1]]
## [1] 11
## 
## [[2]]
## [1] 12
## 
## [[3]]
## [1] 13
```


```r
foreach_loop_results <- foreach(i = 1:3) %dopar% {
    return(my_adder_defualt(i))
}
```

```
## Warning: executing %dopar% sequentially: no parallel backend registered
```


```r
library(doParallel)
```

```
## Loading required package: iterators
```

```
## Loading required package: parallel
```

```r
# make a cluster and specify number of cores to use
cl <- makeCluster(4)
registerDoParallel(cl)
foreach_loop_results <- foreach(i = 1:3) %dopar% {
    Sys.sleep(4)
    return(my_adder_defualt(i))
}
stopCluster(cl)
registerDoSEQ()
```


```r
foreach_loop_results
```

```
## [[1]]
## [1] 11
## 
## [[2]]
## [1] 12
## 
## [[3]]
## [1] 13
```


```r
seq(1, 10, 2)
```

```
## [1] 1 3 5 7 9
```

# parallel apply family

```r
cl <- makeCluster(4)
registerDoParallel(cl)

parSapply(cl = cl, X = 1:4, FUN = my_adder_defualt)
```

```
## [1] 11 12 13 14
```

```r
stopCluster(cl)
registerDoSEQ()
```


http://dads2busy.github.io/2012/05/Parallel

http://dads2busy.github.io/languages/R/


```r
source('mods.R')
```

