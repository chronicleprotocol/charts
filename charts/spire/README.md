# spire

![Version: 0.0.4](https://img.shields.io/badge/Version-0.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.10.4-rc.1](https://img.shields.io/badge/AppVersion-0.10.4--rc.1-informational?style=flat-square)

A Helm chart for deploying spire to  Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://chroniclelabs.org> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://chronicleprotocol.github.io/charts/ | tor-proxy | 0.0.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| configHcl | string | `"variables {\n  # List of feeds that are allowed to send price updates and event attestations.\n  feeds = try(env.CFG_FEEDS == \"\" ? [] : split(\",\", env.CFG_FEEDS), [\n    \"0xDA1d2961Da837891f43235FddF66BAD26f41368b\",\n    \"0x4b0E327C08e23dD08cb87Ec994915a5375619aa2\",\n    \"0x75ef8432566A79C86BBF207A47df3963B8Cf0753\",\n    \"0x83e23C207a67a9f9cB680ce84869B91473403e7d\",\n    \"0xFbaF3a7eB4Ec2962bd1847687E56aAEE855F5D00\",\n    \"0xfeEd00AA3F0845AFE52Df9ECFE372549B74C69D2\",\n    \"0x71eCFF5261bAA115dcB1D9335c88678324b8A987\",\n    \"0x8ff6a38A1CD6a42cAac45F08eB0c802253f68dfD\",\n    \"0x16655369Eb59F3e1cAFBCfAC6D3Dd4001328f747\",\n    \"0xD09506dAC64aaA718b45346a032F934602e29cca\",\n    \"0xc00584B271F378A0169dd9e5b165c0945B4fE498\",\n    \"0x60da93D9903cb7d3eD450D4F81D402f7C4F71dd9\",\n    \"0xa580BBCB1Cee2BCec4De2Ea870D20a12A964819e\",\n    \"0xD27Fa2361bC2CfB9A591fb289244C538E190684B\",\n    \"0x8de9c5F1AC1D4d02bbfC25fD178f5DAA4D5B26dC\",\n    \"0xE6367a7Da2b20ecB94A25Ef06F3b551baB2682e6\",\n    \"0xA8EB82456ed9bAE55841529888cDE9152468635A\",\n    \"0x130431b4560Cd1d74A990AE86C337a33171FF3c6\",\n    \"0x8aFBD9c3D794eD8DF903b3468f4c4Ea85be953FB\",\n    \"0xd94BBe83b4a68940839cD151478852d16B3eF891\",\n    \"0xC9508E9E3Ccf319F5333A5B8c825418ABeC688BA\",\n    \"0x77EB6CF8d732fe4D92c427fCdd83142DB3B742f7\",\n    \"0x3CB645a8f10Fb7B0721eaBaE958F77a878441Cb9\",\n    \"0x4f95d9B4D842B2E2B1d1AC3f2Cf548B93Fd77c67\",\n    \"0xaC8519b3495d8A3E3E44c041521cF7aC3f8F63B3\",\n    \"0xd72BA9402E9f3Ff01959D6c841DDD13615FFff42\"\n  ])\n}\n\nethereum {\n  rand_keys = try(env.CFG_ETH_FROM, \"\") == \"\" ? [\"default\"] : []\n\n  dynamic \"key\" {\n    for_each = try(env.CFG_ETH_FROM, \"\") == \"\" ? [] : [1]\n    labels   = [\"default\"]\n    content {\n      address         = try(env.CFG_ETH_FROM, \"\")\n      keystore_path   = try(env.CFG_ETH_KEYS, \"\")\n      passphrase_file = try(env.CFG_ETH_PASS, \"\")\n    }\n  }\n\n  client \"default\" {\n    rpc_urls     = try(env.CFG_ETH_RPC_URLS == \"\" ? [] : split(\",\", env.CFG_ETH_RPC_URLS), [\n      \"https://eth.public-rpc.com\"\n    ])\n    chain_id     = tonumber(try(env.CFG_ETH_CHAIN_ID, \"1\"))\n    ethereum_key = \"default\"\n  }\n\n  client \"arbitrum\" {\n    rpc_urls     = try(env.CFG_ETH_ARB_RPC_URLS == \"\" ? [] : split(\",\", env.CFG_ETH_ARB_RPC_URLS), [\n      \"https://arbitrum.public-rpc.com\"\n    ])\n    chain_id     = tonumber(try(env.CFG_ETH_ARB_CHAIN_ID, \"42161\"))\n    ethereum_key = \"default\"\n  }\n\n  client \"optimism\" {\n    rpc_urls     = try(env.CFG_ETH_OPT_RPC_URLS == \"\" ? [] : split(\",\", env.CFG_ETH_OPT_RPC_URLS), [\n      \"https://mainnet.optimism.io\"\n    ])\n    chain_id     = tonumber(try(env.CFG_ETH_OPT_CHAIN_ID, \"10\"))\n    ethereum_key = \"default\"\n  }\n}\n\ntransport {\n  # LibP2P transport configuration. Always enabled.\n  libp2p {\n    feeds           = var.feeds\n    priv_key_seed   = try(env.CFG_LIBP2P_PK_SEED, \"\")\n    listen_addrs    = try(split(\",\", env.CFG_LIBP2P_LISTEN_ADDRS), [\"/ip4/0.0.0.0/tcp/8000\"])\n    bootstrap_addrs = try(env.CFG_LIBP2P_BOOTSTRAP_ADDRS == \"\" ? [] : split(\",\", env.CFG_LIBP2P_BOOTSTRAP_ADDRS), [\n      \"/dns/spire-bootstrap1.makerops.services/tcp/8000/p2p/12D3KooWRfYU5FaY9SmJcRD5Ku7c1XMBRqV6oM4nsnGQ1QRakSJi\",\n      \"/dns/spire-bootstrap2.makerops.services/tcp/8000/p2p/12D3KooWBGqjW4LuHUoYZUhbWW1PnDVRUvUEpc4qgWE3Yg9z1MoR\"\n    ])\n    direct_peers_addrs = try(env.CFG_LIBP2P_DIRECT_PEERS_ADDRS == \"\" ? [] : split(\",\", env.CFG_LIBP2P_DIRECT_PEERS_ADDRS), [])\n    blocked_addrs      = try(env.CFG_LIBP2P_BLOCKED_ADDRS == \"\" ? [] : split(\",\", env.CFG_LIBP2P_BLOCKED_ADDRS), [])\n    disable_discovery  = tobool(try(env.CFG_LIBP2P_DISABLE_DISCOVERY, false))\n    ethereum_key       = try(env.CFG_ETH_FROM, \"\") == \"\" ? \"\" : \"default\"\n  }\n\n  # WebAPI transport configuration. Enabled if CFG_WEBAPI_LISTEN_ADDR is set to a listen address.\n  dynamic \"webapi\" {\n    for_each = try(env.CFG_WEBAPI_LISTEN_ADDR, \"\") == \"\" ? [] : [1]\n    content {\n      feeds             = var.feeds\n      listen_addr       = try(env.CFG_WEBAPI_LISTEN_ADDR, \"0.0.0.0.8080\")\n      socks5_proxy_addr = try(env.CFG_WEBAPI_SOCKS5_PROXY_ADDR, \"127.0.0.1:9050\")\n      ethereum_key      = try(env.CFG_ETH_FROM, \"\") == \"\" ? \"\" : \"default\"\n\n      # Ethereum based address book. Enabled if CFG_WEBAPI_ETH_ADDR_BOOK is set to a contract address.\n      dynamic \"ethereum_address_book\" {\n        for_each = try(env.CFG_WEBAPI_ETH_ADDR_BOOK, \"\") == \"\" ? [] : [1]\n        content {\n          contract_addr   = try(env.CFG_WEBAPI_ETH_ADDR_BOOK, \"\")\n          ethereum_client = \"default\"\n        }\n      }\n\n      # Static address book. Enabled if CFG_WEBAPI_STATIC_ADDR_BOOK is set to a comma separated list of addresses.\n      dynamic \"static_address_book\" {\n        for_each = try(env.CFG_WEBAPI_STATIC_ADDR_BOOK, \"\") == \"\" ? [] : [1]\n        content {\n          addresses = try(split(\",\", env.CFG_WEBAPI_STATIC_ADDR_BOOK), \"\")\n        }\n      }\n    }\n  }\n}\n\nspire {\n  rpc_listen_addr = try(env.CFG_SPIRE_RPC_ADDR, \"0.0.0.0:9100\")\n  rpc_agent_addr  = try(env.CFG_SPIRE_RPC_ADDR, \"127.0.0.1:9100\")\n\n  # List of pairs that are collected by the spire node. Other pairs are ignored.\n  pairs = try(env.CFG_SPIRE_PAIRS == \"\" ? [] : split(\",\", env.CFG_SPIRE_PAIRS), [\n    \"AAVEUSD\",\n    \"AVAXUSD\",\n    \"BALUSD\",\n    \"BATUSD\",\n    \"BTCUSD\",\n    \"COMPUSD\",\n    \"CRVUSD\",\n    \"DOTUSD\",\n    \"ETHBTC\",\n    \"ETHUSD\",\n    \"FILUSD\",\n    \"GNOUSD\",\n    \"IBTAUSD\",\n    \"LINKUSD\",\n    \"LRCUSD\",\n    \"MANAUSD\",\n    \"MKRETH\",\n    \"MKRUSD\",\n    \"PAXGUSD\",\n    \"RETHUSD\",\n    \"SNXUSD\",\n    \"SOLUSD\",\n    \"UNIUSD\",\n    \"USDTUSD\",\n    \"WNXMUSD\",\n    \"XRPUSD\",\n    \"XTZUSD\",\n    \"YFIUSD\",\n    \"ZECUSD\",\n    \"ZRXUSD\",\n    \"STETHUSD\",\n    \"WSTETHUSD\",\n    \"MATICUSD\"\n  ])\n}\n"` |  |
| env.normal.CFG_WEBAPI_ETH_ADDR_BOOK | string | `"0xd51Fd30C873356b432F766eB55fc599586734a95"` |  |
| env.normal.CFG_WEBAPI_LISTEN_ADDR | string | `"0.0.0.0:8080"` |  |
| fullnameOverride | string | `"spire"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/chronicleprotocol/spire"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| keystore.enabled | bool | `false` |  |
| keystore.ethFromAddress | string | `"0xA23184c1Ac6F51c4b1b462c108E4652Dc9B4f5A6"` |  |
| keystore.keyStoreFile | string | `"{\"address\":\"a23184c1ac6f51c4b1b462c108e4652dc9b4f5a6\",\"id\":\"073dd01b-1b87-46b4-b52f-ca243bcf4b7b\",\"version\":3,\"Crypto\":{\"cipher\":\"aes-128-ctr\",\"cipherparams\":{\"iv\":\"8491d0eb057afca54a339c25163a6928\"},\"ciphertext\":\"006b10186ff3f4b9b1638ad176a83cd02eb8b6d687e651bad2e38fb91060e68d\",\"kdf\":\"scrypt\",\"kdfparams\":{\"salt\":\"1010801fe1140932f9a078010236292a481dc065b5bacb1aca8d7178d164340f\",\"n\":131072,\"dklen\":32,\"p\":1,\"r\":8},\"mac\":\"d91389bec6bcded7d67fd587b8c08a1136612eda15de88bf881d61ad46827674\"},\"crypto\":{\"cipher\":\"aes-128-ctr\",\"cipherparams\":{\"iv\":\"8491d0eb057afca54a339c25163a6928\"},\"ciphertext\":\"006b10186ff3f4b9b1638ad176a83cd02eb8b6d687e651bad2e38fb91060e68d\",\"kdf\":\"scrypt\",\"kdfparams\":{\"salt\":\"1010801fe1140932f9a078010236292a481dc065b5bacb1aca8d7178d164340f\",\"n\":131072,\"dklen\":32,\"p\":1,\"r\":8},\"mac\":\"d91389bec6bcded7d67fd587b8c08a1136612eda15de88bf881d61ad46827674\"}}"` |  |
| keystore.password | string | `"ilikeapples"` |  |
| logLevel | string | `"debug"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.ports.libp2p.port | int | `8000` |  |
| service.ports.libp2p.protocol | string | `"TCP"` |  |
| service.ports.rpc.port | int | `9100` |  |
| service.ports.rpc.protocol | string | `"TCP"` |  |
| service.ports.webapi.port | int | `8080` |  |
| service.ports.webapi.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| tor-proxy.enabled | bool | `true` |  |
| tor-proxy.env.normal.TOR_EXTRA_ARGS | string | `"AutomapHostsOnResolve 1\nControlSocketsGroupWritable 1\nCookieAuthentication 1\nCookieAuthFileGroupReadable 1\nDNSPort 5353\nExitPolicy reject *:*\nLog notice stderr\nRunAsDaemon 0\nControlSocket /home/tor/.tor/control_socket\nCookieAuthFile /home/tor/.tor/control_socket.authcookie\nDataDirectory /home/tor/.tor\nHiddenServiceDir /var/lib/tor/hidden_services\nHiddenServicePort 8888 spire:8080\nHiddenServiceVersion 3\n"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
