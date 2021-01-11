#' Get A Block Signature Datetime
#'
#' @param block_height The block height. If set to `"latest"`, returns the
#' latest block available.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns a data.frame with the block height and the signature datetime.
#' @export
#'
#' @examples
#' \dontrun{
#' get_block("11601973", MY_API_KEY)
#' get_block("latest", MY_API_KEY)
#' }
get_block <- function(block_height, api_key, ...) {
  endpoint <- paste0("v1/1/block_v2/", block_height, "/")

  get_simple_endpoint(endpoint, api_key, ...)
}
