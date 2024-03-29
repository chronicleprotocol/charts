# feed

![Version: 0.2.8](https://img.shields.io/badge/Version-0.2.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.29.2](https://img.shields.io/badge/AppVersion-0.29.2-informational?style=flat-square)

A Helm chart for deploying Chronicle Validators   on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://chronicleprotocol.github.io/charts/ | ghost | 0.2.0 |
| https://chronicleprotocol.github.io/charts/ | musig | 0.2.0 |
| https://chronicleprotocol.github.io/charts/ | tor-proxy | 0.0.8 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraObjects | list | `[]` | Extra K8s manifests to deploy |
| ghost | object | `{"chainId":null,"enabled":true,"env":{"normal":{"CFG_WEBAPI_ENABLE":1,"CFG_WEBAPI_LISTEN_ADDR":"","CFG_WEBAPI_SOCKS5_PROXY_ADDR":"tor-proxy:9050"}},"ethChainId":1,"ethConfig":{},"ethRpcUrl":null,"fullnameOverride":"ghost","image":{"tag":"0.29.2"},"logFormat":null,"logLevel":"warning","rpcUrl":null,"service":{"ports":{"libp2p":{"port":8000,"protocol":"TCP"}},"type":"LoadBalancer"},"watchdogConfigReg":"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3","watchdogInterval":"900s"}` | Ghost component of the feed |
| ghost.chainId | string | `nil` | default eth chain id for `rpcUrl` |
| ghost.enabled | bool | `true` | values for musig: refer to the [ghost](https://github.com/chronicleprotocol/charts/blob/main/charts/ghost/values.yaml) subchart |
| ghost.env | object | `{"normal":{"CFG_WEBAPI_ENABLE":1,"CFG_WEBAPI_LISTEN_ADDR":"","CFG_WEBAPI_SOCKS5_PROXY_ADDR":"tor-proxy:9050"}}` | non-sensitive variables passed to container as environment variables |
| ghost.ethChainId | int | `1` | eth chain id for `ethRpcUrl` |
| ghost.ethConfig | object | `{}` | Provide eth keystore, eth from address and eth password from existing secrets |
| ghost.ethRpcUrl | string | `nil` | eth RPC url (always ethereum mainnet) |
| ghost.logFormat | string | `nil` | log format (json, text) |
| ghost.logLevel | string | `"warning"` | log level (debug, info, warning, error) |
| ghost.rpcUrl | string | `nil` | default eth RPC url (can be testnet or mainnet) |
| ghost.watchdogConfigReg | string | `"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3"` | WATCHDOG onchain registry address |
| ghost.watchdogInterval | string | `"900s"` | WATCHDOG interval (in seconds) |
| musig | object | `{"enabled":true,"env":{"normal":{"CFG_WEBAPI_ENABLE":1,"CFG_WEBAPI_LISTEN_ADDR":":8080","CFG_WEBAPI_SOCKS5_PROXY_ADDR":"tor-proxy:9050"}},"ethChainId":1,"ethConfig":{},"ethRpcUrl":null,"fullnameOverride":"musig","image":{"tag":"0.29.2"},"imagePullSecrets":[],"logFormat":null,"logLevel":"warning","service":{"ports":{"libp2p":{"port":8001,"protocol":"TCP"},"webapi":{"port":8080,"protocol":"TCP"}},"type":"LoadBalancer"},"watchdogConfigReg":"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3","watchdogInterval":"900s"}` | Musig component of the feed |
| musig.enabled | bool | `true` | values for musig: refer to the [musig](https://github.com/chronicleprotocol/charts/blob/main/charts/musig/values.yaml) subchart |
| musig.env | object | `{"normal":{"CFG_WEBAPI_ENABLE":1,"CFG_WEBAPI_LISTEN_ADDR":":8080","CFG_WEBAPI_SOCKS5_PROXY_ADDR":"tor-proxy:9050"}}` | non-sensitive variables passed to container as environment variables |
| musig.ethChainId | int | `1` | default eth chain id for `ethRpcUrl` |
| musig.ethConfig | object | `{}` | Provide eth keystore, eth from address and eth password from existing secrets |
| musig.ethRpcUrl | string | `nil` | default eth RPC url (can be testnet or mainnet). Must mach same chain `.Values.ghost.rpcUrl` |
| musig.logFormat | string | `nil` | log format (json, text) |
| musig.logLevel | string | `"warning"` | log level (debug, info, warning, error) |
| musig.watchdogConfigReg | string | `"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3"` | WATCHDOG onchain registry address |
| musig.watchdogInterval | string | `"900s"` | WATCHDOG interval (in seconds) |
| tor-proxy | object | `{"enabled":true,"env":{"normal":{"TOR_EXTRA_ARGS":"SocksPort 0.0.0.0:9050\nHiddenServiceDir /var/lib/tor/hidden_services\nHiddenServicePort 8888 musig:8080\n"}},"fullnameOverride":"tor-proxy","service":{"ports":{"socks":{"port":9050,"protocol":"TCP"}},"type":"ClusterIP"},"torConfig":{}}` | Tor proxy component of the feed for WEB_API transport. |
| tor-proxy.enabled | bool | `true` | values for tor-proxy: refer to the [tor-proxy](https://github.com/chronicleprotocol/charts/blob/main/charts/tor-proxy/values.yaml) subchart |
| tor-proxy.env | object | `{"normal":{"TOR_EXTRA_ARGS":"SocksPort 0.0.0.0:9050\nHiddenServiceDir /var/lib/tor/hidden_services\nHiddenServicePort 8888 musig:8080\n"}}` | non-sensitive variables passed to container as environment variables |
| tor-proxy.torConfig | object | `{}` | provide tor keys from existing secret |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
