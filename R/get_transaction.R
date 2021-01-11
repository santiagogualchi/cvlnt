#' Get A Transaction
#'
#' @param tx_hash The transaction hash.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns a data.frame with a transaction's data.
#' @export
#'
#' @examples
#' \dontrun{
#' tx_hash <- "0xbda92389200cadac424d64202caeab70cd5e93756fe34c08578adeb310bba254"
#'
#' get_transaction(tx_hash, MY_API_KEY)
#' }
get_transaction <- function(tx_hash, api_key, ...) {
  endpoint <- paste0("v1/1/transaction_v2/", tx_hash, "/")

  get_simple_endpoint(endpoint, api_key, ...)
}
