
<!-- README.md is generated from README.Rmd. Please edit that file -->
About `sysuse`
==============

The goal of `sysuse` is to store the Stata example datasets locally so that using them in R will be even easier.

Example datasets are of great help when it comes to learning new concepts or tools in data science. Many R packages provide example code using datasets such as `mtcars` or `iris`. For new learners who are not familiar with such data (or for those who dislike cars and flowers), being forced to use them might add unnecessary cognitive load.

Stata users who are new to R might find it instructive to switch back to some old familiar datasets such as `uslifeexp` or `nlsw88`. Thanks to the R packages [`haven`](https://github.com/tidyverse/haven/) and [`webuse`](https://github.com/leeper/webuse), loading datasets from [Stata's online collection](http://www.stata-press.com/data/r14/g.html) is a breeze:

``` r
webuse::webuse("nlsw88")
nlsw88
#> # A tibble: 2,246 x 17
#>    idcode   age      race   married never_married grade  collgrad south
#>     <dbl> <dbl> <dbl+lbl> <dbl+lbl>         <dbl> <dbl> <dbl+lbl> <dbl>
#>  1      1    37         2         0             0    12         0     0
#>  2      2    37         2         0             0    12         0     0
#>  3      3    42         2         0             1    12         0     0
#>  4      4    43         1         1             0    17         1     0
#>  5      6    42         1         1             0    12         0     0
#>  6      7    39         1         1             0    12         0     0
#>  7      9    37         1         0             0    12         0     0
#>  8     12    40         1         1             0    18         1     0
#>  9     13    40         1         1             0    14         0     0
#> 10     14    40         1         1             0    15         0     0
#> # ... with 2,236 more rows, and 9 more variables: smsa <dbl+lbl>,
#> #   c_city <dbl>, industry <dbl+lbl>, occupation <dbl+lbl>,
#> #   union <dbl+lbl>, wage <dbl>, hours <dbl>, ttl_exp <dbl>, tenure <dbl>
```

The function `webuse::webuse()` is like the Stata command `webuse`. Similarly, the current package `sysuse` tries to call the datasets from local directories, just like Stata's `sysuse` command. Once the package is installed, you can load your favorite data without the internet connection and with just one line of code:

``` r
nlsw88
#> # A tibble: 2,246 x 17
#>    idcode   age      race   married never_married grade  collgrad south
#>     <dbl> <dbl> <dbl+lbl> <dbl+lbl>         <dbl> <dbl> <dbl+lbl> <dbl>
#>  1      1    37         2         0             0    12         0     0
#>  2      2    37         2         0             0    12         0     0
#>  3      3    42         2         0             1    12         0     0
#>  4      4    43         1         1             0    17         1     0
#>  5      6    42         1         1             0    12         0     0
#>  6      7    39         1         1             0    12         0     0
#>  7      9    37         1         0             0    12         0     0
#>  8     12    40         1         1             0    18         1     0
#>  9     13    40         1         1             0    14         0     0
#> 10     14    40         1         1             0    15         0     0
#> # ... with 2,236 more rows, and 9 more variables: smsa <dbl+lbl>,
#> #   c_city <dbl>, industry <dbl+lbl>, occupation <dbl+lbl>,
#> #   union <dbl+lbl>, wage <dbl>, hours <dbl>, ttl_exp <dbl>, tenure <dbl>
```

Installation
============

``` r
# install.packages("devtools")
devtools::install_github("jjchern/sysuse")
# To uninstall the package, use:
# remove.packages("sysuse")
```

Example
=======

Suppose you try to learn how to do a two-way table of frequency counts in tidyverse and come across [an excellent tutorial](https://gist.github.com/jennybc/04b71bfaaf0f88d9d2eb) from the wonderful @jennybc. The code is just what you want to learn, but it might be off-putting to see that `mtcars` are being used again, and the two columns `cyl` and `vs` could be some of the dullest variables you can imagine. It would be nice to use the `nlsw88` instead:

``` r
library(tidyverse)
nlsw88 %>%
    haven::as_factor() %>% 
    count(married, race) %>% 
    spread(race, n, fill = 0)
#> # A tibble: 2 x 4
#>   married white black other
#> *  <fctr> <dbl> <dbl> <dbl>
#> 1  single   487   309     8
#> 2 married  1150   274    18
```
