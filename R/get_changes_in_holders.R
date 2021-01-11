#' Get Changes In Token Holders Between Two Block Heights
#'
#' @param token_contract The token contract address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param starting_block Starting block to define a block range.
#' @param ending_block Ending block to define a block range.
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns a data.frame with the current/historical balances for the specified
#' token contract of all holders.
#' @export
#'
#' @examples
#' \dontrun{
#' contract <- "0x0954906da0Bf32d5479e25f46056d22f08464cab"
#'
#' get_changes_in_holders(contract, MY_API_KEY, starting_block = "11500000")
#'
#' get_changes_in_holders(contract, MY_API_KEY, starting_block = "11500000",
#'                        ending_block = "11550000")
#' }
get_changes_in_holders <- function(token_contract, api_key, starting_block,
                                   ending_block = "latest", sleep = 1/10, ...) {
  endpoint <- paste0("v1/1/tokens/", token_contract, "/token_holders_changes/")

  get_paginated_endpoint(endpoint, api_key, sleep,
                         "starting-block" = starting_block,
                         "ending-block" = ending_block, ...)


}
