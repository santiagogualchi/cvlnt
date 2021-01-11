#' Get Token Address Balances
#'
#' @param address character. The wallet address.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param chain_id Chain ID of the Blockchain being queried. Supports "137" for
#' Matic, defaults to "1" for Ethereum Mainnet.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns a data.frame with all ERC20 and NFT token balances along with their
#' current spot prices.
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0xe6a7a1d47ff21b6321162aea7c6cb457d5476bca"
#'
#' get_address_balances(address, MY_API_KEY)
#' get_address_balances(address, MY_API_KEY, "quote-currency" = "eth")
#' }
get_address_balances <- function(address, api_key, chain_id = "1", ...) {
  endpoint <- paste0("v1/", chain_id, "/address/", address, "/balances_v2/")

  get_simple_endpoint(endpoint, api_key, ...)
}
