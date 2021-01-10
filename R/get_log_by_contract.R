#' Get Log Events By Contract Address
#'
#' @param contract The contract address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param starting_block First block to retrieve log events.
#' @param ending_block Last block to retrieve log events.
#' @param ... Additional arguments to pass to the request.
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
#' get_log_by_contract(contract, MY_API_KEY, starting_block = "9601459",
#'                     ending_block = "10005000")
#' }
get_log_by_contract <- function(contract, api_key, starting_block,
                                ending_block, ...) {
  endpoint <- paste0("https://api.covalenthq.com/v1/1/events/address/",
                     contract,
                     "/")

  get_paginated_endpoint(endpoint, api_key, "starting-block" = starting_block,
                         "ending-block" = ending_block, ...)
}
