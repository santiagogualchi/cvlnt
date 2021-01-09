#' Parses Named Parameters as a Query String
#'
#' @param ... Named arguments
#'
#' @return Returns an atomic character with the parameters as a query string.
#'
#' @examples
#' \dontrun{
#' x <- parse_params("page-number" = "1", "block-height" = "10000")
#' x == "page-number=1&block-height=10000" # TRUE.
#' }
parse_params <- function(...) {
  params <- list(...)
  if (!length(params)) return(character(0))

  if (!all_named(params)) {
    stop("Some query parameters are not named.")
  }

  paste0(names(params), "=", params,
         collapse = "&")
}
