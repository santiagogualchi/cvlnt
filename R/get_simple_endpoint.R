#' Get Unpaginated Data from an Endpoint
#'
#' @param endpoint The endpoint's URI.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param ... Additional arguments to pass to the request.
#'
#' @return
#' Returns the data for the requested endpoint as a data.frame.
#' @export
#'
#' @examples
#' \dontrun{
#' endpoint <- paste0("https://api.covalenthq.com/v1/1/address/",
#'                    "0xe6a7a1d47ff21b6321162aea7c6cb457d5476bca",
#'                    "/balances_v2/")
#'
#' get_simple_endpoint(endpoint, MY_API_KEY)
#' get_simple_endpoint(endpoint, MY_API_KEY, "quote-currency" = "eth")
#' }
get_simple_endpoint <- function(endpoint, api_key, ...) {
  results <- get_endpoint(endpoint, api_key, ...)

  as.data.frame(do.call(rbind, results$items))

}
