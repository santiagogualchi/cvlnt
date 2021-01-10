#' Get External NFT Metadata
#'
#' @param address An ERC751 or ERC1155 NFT contract address.
#' @param token_id The NFT token ID.
#' @param api_key The user's public API key. To generate it, you need an account
#' at [Covalent HQ](https://www.covalenthq.com/).
#' @param ... Additional arguments to pass to the request.
#'
#' @return
#' Returns a data.frame with an NFT external metadata.
#' @export
#'
#' @examples
#' \dontrun{
#' address <- "0xe4605d46fd0b3f8329d936a8b258d69276cba264"
#' token_id <- "123"
#'
#' get_nft_metadata(address, token_id, MY_API_KEY)
#' }
get_nft_metadata <- function(address, token_id, api_key, ...) {
  endpoint <- paste0("https://api.covalenthq.com/v1/1/tokens/",
                     address,
                     "/nft_metadata/",
                     token_id,
                     "/")

  get_paginated_endpoint(endpoint, api_key, ...)
}
