#' Get Changes In Holders Between Two Block Heights
#'
#' @param token_contract The token contract address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param starting_block First block to retrieve log events.
#' @param ending_block Last block to retrieve log events. If omitted, the latest
#' block is used.
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request.
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
                                   ending_block, sleep = 1/10, ...) {
  endpoint <- paste0("https://api.covalenthq.com/v1/1/tokens/",
                     token_contract,
                     "/token_holders_changes/")

  if (missing(ending_block)) {
    get_paginated_endpoint(endpoint, api_key, sleep,
                           "starting-block" = starting_block, ...)
  } else {
    get_paginated_endpoint(endpoint, api_key, sleep,
                           "starting-block" = starting_block,
                           "ending-block" = ending_block, ...)
  }


}
