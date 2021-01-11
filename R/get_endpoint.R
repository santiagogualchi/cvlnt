#' Performs A Request To A Covalent HQ Endpoint
#'
#' @param endpoint The endpoint's URI.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns the endpoint data for the requested page.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' endpoint <- paste0("v1/1/address/",
#'                    "0xe6a7a1d47ff21b6321162aea7c6cb457d5476bca",
#'                    "/balances_v2/")
#'
#' get_endpoint(endpoint, MY_API_KEY)
#' get_endpoint(endpoint, MY_API_KEY, "block-height" = "11601973")
#' }
get_endpoint <- function(endpoint, api_key, ...) {
  args <- list(...)

  x <- httr::GET(paste0("https://api.covalenthq.com/", endpoint,
                        "?", parse_args(args)),
                 httr::authenticate(api_key, "")) %>%
    httr::content()

  if(x$error) {
    if (x$error_code == "504") {
      message('\nGot Error 504: "', x$error_message, '" for page number ',
              args$`page-number`, ".\n", "Retrying.")
      get_endpoint(endpoint, api_key, ...)
    } else {
      stop("Error ", x$error_code, ": ", x$error_message, ".")
    }
  }

  x$data
}
