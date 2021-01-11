#' Get Transactions
#'
#' @param address The wallet address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param chain_id Chain ID of the Blockchain being queried. Supports "137" for
#' Matic, defaults to "1" for Ethereum Mainnet.
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns all transactions for `address` including their decoded log events as
#' a list on the `log_events` column.
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0x5a6d3b6bf795a3160dc7c139dee9f60ce0f00cae"
#'
#' get_transactions(address, MY_API_KEY)
#' get_transactions(address, MY_API_KEY, "quote-currency" = "eth")
#' }
get_transactions <- function(address, api_key, chain_id = "1", sleep = 1/10,
                             ...) {
  endpoint <- paste0("v1/", chain_id, "/address/", address, "/transactions_v2/")

  get_paginated_endpoint(endpoint, api_key, sleep, ...)
}
