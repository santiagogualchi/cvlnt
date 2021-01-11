#' Get Token Holders As Of A Block Height
#'
#' @param token_contract The token contract address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param block_height The block height. If set to `"latest"`, returns the
#' latest block available.
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @details This endpoint does a deep-crawl of the blockchain to retrieve all
#' kinds of transactions that references the address.
#'
#' @return
#' Returns a data.frame with the balance for the specified token contract of all
#' holders.
#' @export
#'
#' @examples
#' \dontrun{
#' token_contract <- "0x0954906da0Bf32d5479e25f46056d22f08464cab"
#'
#' get_token_holders(token_contract, MY_API_KEY)
#' get_token_holders(token_contract, MY_API_KEY, block_height = "11601973")
#' }
get_token_holders <- function(token_contract, api_key, block_height = "latest",
                              sleep = 1/10, ...) {
  # We need to set block_height to a constant value to prevent retrieving data
  # from different blocks if the latest block changes during data retrieval.
  if (block_height == "latest") block_height <- get_latest_block(api_key)
  endpoint <- paste0("v1/1/tokens/", token_contract, "/token_holders/")

  get_paginated_endpoint(endpoint, api_key, sleep,
                         "block-height" = block_height, ...)
}
