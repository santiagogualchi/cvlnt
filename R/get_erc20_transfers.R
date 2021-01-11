#' Get ERC20 Token Transfers
#'
#' @param address The wallet address.
#' @param token_contract The ERC20 token contract address to retrieve transfers
#' of.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns a data.frame with the transfers of the specified ERC20 token for the
#' specified address.
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0x669184d1fe949249857439232ee67d7adb25d0ae"
#' token_contract <- "0x0954906da0Bf32d5479e25f46056d22f08464cab"
#'
#' get_erc20_transfers(address, token_contract, MY_API_KEY)
#' get_erc20_transfers(address, token_contract, MY_API_KEY,
#'                     "quote-currency" = "eth")
#' }
get_erc20_transfers <- function(address, token_contract, api_key, sleep = 1/10,
                                ...) {

  endpoint <- paste0("v1/1/address/", address, "/transfers_v2/")

  get_paginated_endpoint(endpoint, api_key, sleep,
                         "contract-address" = token_contract, ...)
}
