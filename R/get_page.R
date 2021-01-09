#' Performs a Request to Get a Specific Page of an Endpoint
#'
#' @param endpoint The endpoint's URI.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param page_number The paginator's page number parameter.
#' @param ... Additional arguments to pass to the request.
#'
#' @return
#' Returns the endpoint data for the requested page.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' endpoint <- paste0("https://api.covalenthq.com/v1/1/tokens/",
#'                    "0x0954906da0Bf32d5479e25f46056d22f08464cab",
#'                    "/token_holders/")
#'
#' get_page(endpoint, MY_API_KEY, 12L)
#' get_page(endpoint, MY_API_KEY, 12L, "block-height" = "11601973")
#' }
get_page <- function(endpoint, api_key, page_number, ...) {

  x <- httr::GET(paste0(endpoint, "?", parse_params("page-number" = page_number,
                                                    ...)),
                 httr::authenticate(api_key, "")) %>%
    httr::content()

  if(x$error) {
    stop("Error ", x$error_code, ": ", x$error_message, ".")
  }

  x$data
}
