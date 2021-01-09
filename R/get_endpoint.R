#' Get Data from an Endpoint
#'
#' @param endpoint The endpoint's URI.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param ... Additional arguments to pass to the request.
#' @param sleep Interval in seconds between requests.
#'
#' @return
#' Returns the data for the requested endpoint as a data.frame.
#' @export
#'
#' @examples
#' \dontrun{
#' endpoint <- paste0("https://api.covalenthq.com/v1/1/tokens/",
#'                    "0x0954906da0Bf32d5479e25f46056d22f08464cab",
#'                    "/token_holders/")
#'
#' get_endpoint(endpoint, MY_API_KEY)
#' get_endpoint(endpoint, MY_API_KEY, "block-height" = "11601973")
#' }
get_endpoint <- function(endpoint, api_key, ..., sleep = 1/10) {
  page_number <- 0L
  results <- NULL

  pb <- progress::progress_bar$new(format = paste0(" downloaded :current",
                                                   " page(s) in :elapsed"),
                                   total = NA)

  repeat {
    page <- get_page(endpoint, api_key, page_number, ...)
    has_more <- page$pagination$has_more

    results <- append(results, page$items)

    pb$tick()

    if (!is.null(has_more) && has_more) {
      page_number <- page_number + 1L
      Sys.sleep(sleep)
    }
    else {
      break
    }
  }

  pb$terminate()

  as.data.frame(do.call(rbind, results))

}
