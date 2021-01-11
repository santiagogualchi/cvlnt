#' Get Paginated Data From An Endpoint
#'
#' @param endpoint The endpoint's URI.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns the data for the requested endpoint as a data.frame.
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' endpoint <- paste0("https://api.covalenthq.com/v1/1/tokens/",
#'                    "0x0954906da0Bf32d5479e25f46056d22f08464cab",
#'                    "/token_holders/")
#'
#' get_paginated_endpoint(endpoint, MY_API_KEY)
#' get_paginated_endpoint(endpoint, MY_API_KEY, "block-height" = "11601973")
#' }
get_paginated_endpoint <- function(endpoint, api_key,  sleep = 1/10, ...) {
  page_number <- 0L
  results <- NULL

  pb <- progress::progress_bar$new(format = paste0("Downloaded :current ",
                                                   "page(s) in :elapsed."),
                                   total = NA,
                                   show_after = 0)

  repeat {
    page <- get_endpoint(endpoint, api_key, "page-number" = page_number, ...)
    has_more <- page$pagination$has_more

    results <- append(results, page$items)

    pb$tick()

    if (has_more) {
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
