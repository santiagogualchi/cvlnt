#' Get Data of a Token's Holders
#'
#' @param token_contract The token contract address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param ... Additional arguments to pass to the request.
#' @param sleep Interval in seconds between requests.
#'
#' @return
#' Returns a data.frame with the balance for the specified token contract of all
#' holders.
#' @export
#'
#' @examples
#' \dontrun{
#' tc <- "0x0954906da0Bf32d5479e25f46056d22f08464cab"
#'
#' get_token_holders(tc, MY_API_KEY)
#' get_token_holders(tc, MY_API_KEY, "block-height" = "11601973")
#' }
get_token_holders <- function(token_contract, api_key, ..., sleep = 1/10) {
  endpoint <- paste0("https://api.covalenthq.com/v1/1/tokens/",
                     token_contract,
                     "/token_holders/")

  get_endpoint(endpoint, api_key, ..., sleep = sleep)
}
