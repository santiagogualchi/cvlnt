
# cvlnt

<!-- badges: start -->
<!-- badges: end -->

The goal of cvlnt is to provide an R interface for
[Covalent HQ](https://www.covalenthq.com/)'s API. 

## Installation

You can install the development version of cvlnt with:

``` r
# install.packages("devtools")
devtools::install_github("santiagogualchi/cvlnt")
```

## Example

This is a basic example which shows you how to download the current balances of
all
[$INDEX](https://etherscan.io/address/0x0954906da0Bf32d5479e25f46056d22f08464cab)
holders:

``` r
library(cvlnt)

index_contract <- "0x0954906da0Bf32d5479e25f46056d22f08464cab"
get_token_holders(index_contract, api_key = MY_API_KEY)
```

Please note that you need to replace the `MY_API_KEY` variable with a proper
API key. You can get one with an account on
[Covalent HQ](https://www.covalenthq.com).

