gofer {
  origin "uniswapV3" {
    type = "uniswapV3"
    params = {
      ethereum_client = "default"
      symbol_aliases  = {
        "BTC" = "WBTC",
        "ETH" = "WETH",
        "USD" = "USDC"
      }

      contracts = {
        "GNO/WETH"  = "0xf56d08221b5942c428acc5de8f78489a97fc5599",
        "LINK/WETH" = "0xa6cc3c2531fdaa6ae1a3ca84c2855806728693e8",
        "MKR/USDC"  = "0xc486ad2764d55c7dc033487d634195d6e4a6917e",
        "MKR/WETH"  = "0xe8c6c9227491c0a8156a0106a0204d881bb7e531",
        "USDC/WETH" = "0x88e6a0c2ddd26feeb64f039a2c41296fcb3f5640",
        "YFI/WETH"  = "0x04916039b1f59d9745bf6e0a21f191d1e0a84287"
      }
    }
  }

  price_model "ETH/USD" "median" {
    source "ETH/USD" "indirect" {
      source "ETH/BTC" "origin" { origin = "binance" }
      source "BTC/USD" "origin" { origin = "." }
    }

    source "ETH/USD" "origin" { origin = "bitstamp" }
    source "ETH/USD" "origin" { origin = "coinbasepro" }
    source "ETH/USD" "origin" { origin = "gemini" }
    source "ETH/USD" "origin" { origin = "kraken" }
    source "ETH/USD" "origin" { origin = "uniswapV3" }
    min_sources = 3
  }

  hook "ETH/USD" {
    post_price = {
      ethereum_client  = "default"
      circuit_contract = "0x1234567890123456789012345678901234567890"
    }
  }
}

ethereum {
  client "default" {
    rpc_urls = ["https://eth-mainnet.public.blastapi.io"]

    chain_id = 1
    ethereum_key = "default"
  }
}
