% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_address_balances.R
\name{get_address_balances}
\alias{get_address_balances}
\title{Get Token Address Balances}
\usage{
get_address_balances(address, api_key, chain_id = "1", ...)
}
\arguments{
\item{address}{character. The wallet address.}

\item{api_key}{The user's public API key. To generate it, you need an account
at \href{https://www.covalenthq.com/}{Covalent HQ}.}

\item{chain_id}{Chain ID of the Blockchain being queried. Supports "137" for
Matic, defaults to "1" for Ethereum Mainnet.}

\item{...}{Additional arguments to pass to the request. For more information
on available parameters see
\href{https://www.covalenthq.com/docs/api/}{Covalent HQ API}.}
}
\value{
Returns a data.frame with all ERC20 and NFT token balances along with their
current spot prices.
}
\description{
Get Token Address Balances
}
\examples{
\dontrun{
address <- "0xe6a7a1d47ff21b6321162aea7c6cb457d5476bca"

get_address_balances(address, MY_API_KEY)
get_address_balances(address, MY_API_KEY, "quote-currency" = "eth")
}
}
