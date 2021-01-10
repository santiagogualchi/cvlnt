#' Get a Block Signature Datetime
#'
#' @param block_height The block height. If set to `"latest"`, returns the
#' latest block available.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request.
#'
#' @return
#' Returns a data.frame with the block height and the signature datetime.
#' @export
#'
#' @examples
#' \dontrun{
#' tc <- "0x0954906da0Bf32d5479e25f46056d22f08464cab"
#'
#' get_block("11601973", MY_API_KEY)
#' get_block("latest", MY_API_KEY)
#' }
get_block <- function(block_height, api_key, ...) {
  endpoint <- paste0("https://api.covalenthq.com/v1/1/block_v2/",
                     block_height,
                     "/")

  get_paginated_endpoint(endpoint, api_key, sleep = sleep, ...)
}
