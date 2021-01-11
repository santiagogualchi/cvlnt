#' Parses Named Arguments As A Query String
#'
#' @param args A named list of arguments.
#'
#' @return Returns an atomic character with the arguments as a query string.
#'
#' @examples
#' \dontrun{
#' x <- parse_args(list("page-number" = "1", "block-height" = "10000"))
#' x == "page-number=1&block-height=10000" # TRUE.
#' }
parse_args <- function(args) {
  if (!length(args)) return(character(0))

  if (!all_named(args)) {
    stop("Some query parameters are not named.")
  }

  paste0(names(args), "=", args,
         collapse = "&")
}
