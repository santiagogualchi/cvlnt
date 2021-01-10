#' Get Latest Block
#'
#' @param api_key #' @param api_key The user's public API key. To generate it,
#' you need an account at [Covalent HQ](https://www.covalenthq.com/).
#'
#' @return
#' A character with the latest block height.
#' @export
#'
#' @examples
#' \dontrun{
#' get_latest_block(MY_API_KEY)
#' }
get_latest_block <- function(api_key) {
  get_block("latest", api_key)[[1, "height"]]
}
