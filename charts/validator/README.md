# validator

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.36.0](https://img.shields.io/badge/AppVersion-0.36.0-informational?style=flat-square)

A Helm chart for deploying Chronicle Validator on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake/> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://chronicleprotocol.github.io/charts/ | tor-proxy | 0.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraObjects | list | `[]` | Extra K8s manifests to deploy |
| ghost | object | `{"affinity":{},"arbRpcUrl":null,"chainId":"1","chainName":"eth","env":{"normal":{}},"ethArchRpcUrl":null,"ethConfig":{},"ethRpcUrl":null,"fullnameOverride":"ghost","gnoRpcUrl":null,"image":{"pullPolicy":"Always","repository":"ghcr.io/chronicleprotocol/ghost","tag":"0.36.0@sha256:3d6e79dfcca7e2680889a7f2a433fb0a9cc2fb290e80b67b522963ad0797a9ed"},"imagePullSecrets":[],"ingress":{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"tls":[]},"libP2pSubscriptionBufferSize":"4096","libp2pValidateQueueSize":"4096","liveness":{"enabled":true,"livenessProbe":{"httpGet":{"path":"/healthcheck","port":9100},"initialDelaySeconds":30,"periodSeconds":60}},"logFormat":"text","logLevel":"info","mntRpcUrl":null,"nameOverride":"","nodeSelector":{},"optRpcUrl":null,"podAnnotations":{},"podSecurityContext":{},"polRpcUrl":null,"readiness":{"enabled":true,"readinessProbe":{"httpGet":{"path":"/metrics","port":9100},"initialDelaySeconds":30,"periodSeconds":60}},"replicaCount":1,"resources":{},"rpcUrl":null,"securityContext":{},"service":{"annotations":{},"ports":{"libp2p":{"port":8000,"protocol":"TCP"},"metrics":{"port":9100,"protocol":"TCP"}},"type":"ClusterIP"},"serviceAccount":{"annotations":{},"create":true,"name":""},"tolerations":[],"watchdogConfigReg":"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3","watchdogInterval":"900s","webApi":{"enabled":true,"listenAddr":":8080","socks5ProxyAddr":"tor-proxy:9050"}}` | Values for Ghost |
| ghost.affinity | object | `{}` | pod Affinity spec applied validator |
| ghost.arbRpcUrl | string | `nil` | RPC url for ARB |
| ghost.chainId | string | `"1"` | chain id for the "target" or "main" chain we use for the validator. Can be mainnet ethereum `1` or sepolia ethereum `11155111` |
| ghost.chainName | string | `"eth"` | chain name for the "target" or "main" chain we use for the validator |
| ghost.env | object | `{"normal":{}}` | Environment variable listing |
| ghost.env.normal | object | `{}` | un-encrypted env vars passed to the pod |
| ghost.ethArchRpcUrl | string | `nil` | RPC url for ETH Archival node |
| ghost.ethConfig | object | `{}` | Provide ETH keys from existing secrets : **NB** use only existing secret OR env vars, do not provide both |
| ghost.ethRpcUrl | string | `nil` | RPC URL for ETH |
| ghost.fullnameOverride | string | `"ghost"` | Override the release name to so tor-proxy can work with the default config. NB only change this if you know what you are doing |
| ghost.gnoRpcUrl | string | `nil` | RPC url for GNO |
| ghost.image.tag | string | `"0.36.0@sha256:3d6e79dfcca7e2680889a7f2a433fb0a9cc2fb290e80b67b522963ad0797a9ed"` | Overrides the image tag whose default is the chart appVersion. |
| ghost.ingress | object | `{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"tls":[]}` | Ingress for the validator |
| ghost.ingress.enabled | bool | `false` | Disabled by default, as ingress objects need to be created carefully |
| ghost.libP2pSubscriptionBufferSize | string | `"4096"` | libp2p buffer size |
| ghost.libp2pValidateQueueSize | string | `"4096"` | libp2p validate queue size |
| ghost.liveness | object | `{"enabled":true,"livenessProbe":{"httpGet":{"path":"/healthcheck","port":9100},"initialDelaySeconds":30,"periodSeconds":60}}` | Liveness probe : restart the validator if the healthcheck endpoint is not reachable |
| ghost.logFormat | string | `"text"` | Log format for the validator, can be one of `json`, `text` |
| ghost.logLevel | string | `"info"` | Log level for the validator, can be one of `debug`, `info`, `trace`, `error` |
| ghost.mntRpcUrl | string | `nil` | RPC url for MNT |
| ghost.nodeSelector | object | `{}` | Node selector for the validator |
| ghost.optRpcUrl | string | `nil` | RPC url for OETH (optimism) |
| ghost.podAnnotations | object | `{}` | Pod annotations for the validator |
| ghost.podSecurityContext | object | `{}` | Pod security context for the validator |
| ghost.polRpcUrl | string | `nil` | RPC url for ZKEVM (polygon zkevm) |
| ghost.readiness | object | `{"enabled":true,"readinessProbe":{"httpGet":{"path":"/metrics","port":9100},"initialDelaySeconds":30,"periodSeconds":60}}` | Readiness probe : stop the validator if the metrics endpoint is not reachable |
| ghost.resources | object | `{}` | Resources constraints for the validator, CPU, Memory, etc. |
| ghost.rpcUrl | string | `nil` | RPC url for the "target" or "main" chain we use for the validator. Can be mainnet ethereum or sepolia ethereum |
| ghost.securityContext | object | `{}` | Security context for the validator |
| ghost.service | object | `{"annotations":{},"ports":{"libp2p":{"port":8000,"protocol":"TCP"},"metrics":{"port":9100,"protocol":"TCP"}},"type":"ClusterIP"}` | Service type for the validator |
| ghost.service.annotations | object | `{}` | Annotations to add to the service |
| ghost.service.ports.libp2p | object | `{"port":8000,"protocol":"TCP"}` | libp2p port for the validator service |
| ghost.service.ports.metrics | object | `{"port":9100,"protocol":"TCP"}` | metrics port for the validator service |
| ghost.service.type | string | `"ClusterIP"` | Type of service for the validator, can also be `LoadBalancer` |
| ghost.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| ghost.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| ghost.serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| ghost.tolerations | list | `[]` | Tolerations applied validator |
| ghost.watchdogConfigReg | string | `"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3"` | WATCHDOG onchain config address |
| ghost.watchdogInterval | string | `"900s"` | WATCHDOG polling interval (in seconds) |
| ghost.webApi | object | `{"enabled":true,"listenAddr":":8080","socks5ProxyAddr":"tor-proxy:9050"}` | WEB API (tor-proxy) |
| ghost.webApi.enabled | bool | `true` | Enables the web api and deploys the tor-proxy subchart |
| ghost.webApi.listenAddr | string | `":8080"` | Listen address for the web api |
| ghost.webApi.socks5ProxyAddr | string | `"tor-proxy:9050"` | Socks5 proxy address for the web api |
| tor-proxy | object | `{"enabled":true,"env":{"normal":{"TOR_EXTRA_ARGS":"SocksPort 0.0.0.0:9050\nHiddenServiceDir /var/lib/tor/hidden_services\nHiddenServicePort 8888 ghost:8080\nHiddenServicePort 9999 ghost:9100\nSafeLogging 0\n"}},"fullnameOverride":"tor-proxy","service":{"ports":{"socks":{"port":9050,"protocol":"TCP"}},"type":"ClusterIP"},"torConfig":{}}` | Values for Tor Proxy (subchart of ghost) |
| tor-proxy.enabled | bool | `true` | values for tor-proxy: refer to the [tor-proxy](https://github.com/chronicleprotocol/charts/blob/main/charts/tor-proxy/values.yaml) subchart |
| tor-proxy.env | object | `{"normal":{"TOR_EXTRA_ARGS":"SocksPort 0.0.0.0:9050\nHiddenServiceDir /var/lib/tor/hidden_services\nHiddenServicePort 8888 ghost:8080\nHiddenServicePort 9999 ghost:9100\nSafeLogging 0\n"}}` | non-sensitive variables passed to container as environment variables |
| tor-proxy.torConfig | object | `{}` | provide tor keys from existing secret |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
