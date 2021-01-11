#' Get Log Events By Contract Address
#'
#' @param contract The contract address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param starting_block First block to retrieve log events.
#' @param ending_block Last block to retrieve log events.
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns a data.frame with the decoded log events emitted by a particular
#' smart contract.
#' @export
#'
#' @examples
#' \dontrun{
#' contract <- "0xc0da01a04c3f3e0be433606045bb7017a7323e38"
#'
#' get_log_by_contract(contract, MY_API_KEY, starting_block = "9601459")
#' get_log_by_contract(contract, MY_API_KEY, starting_block = "9601459",
#'                     ending_block = "10005000")
#' }
get_log_by_contract <- function(contract, api_key, starting_block,
                                ending_block = "latest", sleep = 1/10, ...) {
  # Covalent HQ API does not accept "latest" as a value for "ending-block" for
  # this endpoint.
  if (ending_block == "latest") ending_block <- get_latest_block(api_key)

  endpoint <- paste0("v1/1/events/address/", contract, "/")

  get_paginated_endpoint(endpoint, api_key, sleep,
                         "starting-block" = starting_block,
                         "ending-block" = ending_block, ...)
}
