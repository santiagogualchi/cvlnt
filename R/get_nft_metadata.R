#' Get External NFT Metadata
#'
#' @param contract An ERC751 or ERC1155 NFT contract address.
#' @param token_id The NFT token ID.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param sleep Interval in seconds between requests.
#' @param ... Additional arguments to pass to the request. For more information
#' on available parameters see
#' [Covalent HQ API](https://www.covalenthq.com/docs/api/).
#'
#' @return
#' Returns a data.frame with an NFT external metadata.
#' @export
#'
#' @examples
#' \dontrun{
#' contract <- "0xe4605d46fd0b3f8329d936a8b258d69276cba264"
#' token_id <- "123"
#'
#' get_nft_metadata(contract, token_id, MY_API_KEY)
#' }
get_nft_metadata <- function(contract, token_id, api_key, sleep = 1/10, ...) {
  endpoint <- paste0("v1/1/tokens/", contract, "/nft_metadata/", token_id, "/")

  get_paginated_endpoint(endpoint, api_key, sleep, ...)
}
