# validator

![Version: 0.4.6](https://img.shields.io/badge/Version-0.4.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.61.9](https://img.shields.io/badge/AppVersion-0.61.9-informational?style=flat-square)

A Helm chart for deploying Chronicle Validator on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake/> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraObjects | list | `[]` | Extra K8s manifests to deploy |
| ghost | object | `{"argsOverride":[],"commandOverride":null,"env":{"normal":{},"raw":{}},"ethConfig":{},"rpcUrl":null,"service":{"annotations":{},"ports":{"libp2p":{"port":8000,"protocol":"TCP"},"webapi":{"port":8080,"protocol":"TCP"}},"type":"LoadBalancer"},"watchdogConfigReg":"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3","webApi":{"enabled":true,"listenAddr":"0.0.0.0:8080"}}` | Values for Ghost |
| ghost.argsOverride | list | `[]` | args override for the validator |
| ghost.commandOverride | string | `nil` | command override for the validator |
| ghost.env | object | `{"normal":{},"raw":{}}` | Environment variable listing |
| ghost.env.normal | object | `{}` | un-encrypted env vars passed to the pod |
| ghost.ethConfig | object | `{}` | Provide ETH keys from existing secrets : **NB** use only existing secret OR env vars, do not provide both |
| ghost.service | object | `{"annotations":{},"ports":{"libp2p":{"port":8000,"protocol":"TCP"},"webapi":{"port":8080,"protocol":"TCP"}},"type":"LoadBalancer"}` | Service type for the validator |
| ghost.service.annotations | object | `{}` | Annotations to add to the service |
| ghost.service.ports.libp2p | object | `{"port":8000,"protocol":"TCP"}` | libp2p port for the validator service |
| ghost.service.ports.webapi | object | `{"port":8080,"protocol":"TCP"}` | webapi listen port for the validator service |
| ghost.service.type | string | `"LoadBalancer"` | Type of service for the validator, only `LoadBalancer` supported for now |
| ghost.watchdogConfigReg | string | `"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3"` | WATCHDOG onchain config address |
| ghost.webApi | object | `{"enabled":true,"listenAddr":"0.0.0.0:8080"}` | WEB API (tor-proxy) |
| ghost.webApi.enabled | bool | `true` | Enables the web api and deploys the tor-proxy subchart |
| ghost.webApi.listenAddr | string | `"0.0.0.0:8080"` | Listen address for the web api |
| global | object | `{"affinity":{},"chainId":1,"chainName":"eth","chainTxType":"eip1559","fullnameOverride":"ghost","image":{"pullPolicy":"Always","repository":"ghcr.io/chronicleprotocol/ghost","tag":"0.61.13@sha256:d230400a477042ff6af80d25725aaad85d8ddbfe32e989a347584d63efaee4bc"},"imagePullSecrets":[],"liveness":{"enabled":true,"livenessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}},"logFormat":"text","logLevel":"info","metrics":{"enabled":true,"port":9090},"nameOverride":"","nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"readiness":{"enabled":true,"readinessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}},"replicaCount":1,"resources":{},"securityContext":{},"serviceAccount":{"annotations":{},"create":"true","name":""},"tolerations":[]}` | Global values for the validator chart, values are used across the chart resources |
| global.affinity | object | `{}` | pod Affinity spec applied validator |
| global.chainId | int | `1` | chain id for the "target" or "main" chain we use for the validator. Can be mainnet ethereum `1` or sepolia ethereum `11155111` |
| global.chainName | string | `"eth"` | chain name for the "target" or "main" chain we use for the validator |
| global.chainTxType | string | `"eip1559"` | chain tx type for the "target" or "main" chain we use for the validator. Can be mainnet ethereum `eip1559` or `legacy` |
| global.fullnameOverride | string | `"ghost"` | Override the release name to so tor-proxy can work with the default config. NB only change this if you know what you are doing |
| global.image | object | `{"pullPolicy":"Always","repository":"ghcr.io/chronicleprotocol/ghost","tag":"0.61.13@sha256:d230400a477042ff6af80d25725aaad85d8ddbfe32e989a347584d63efaee4bc"}` | Image for the validator |
| global.image.tag | string | `"0.61.13@sha256:d230400a477042ff6af80d25725aaad85d8ddbfe32e989a347584d63efaee4bc"` | Overrides the image tag whose default is the chart appVersion. |
| global.liveness | object | `{"enabled":true,"livenessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}}` | Liveness probe : restart the validator if the healthcheck endpoint is not reachable |
| global.logFormat | string | `"text"` | Log format for the validator, can be one of `json`, `text` |
| global.logLevel | string | `"info"` | Log level for the validator, can be one of `debug`, `info`, `warning`, `error` |
| global.metrics | object | `{"enabled":true,"port":9090}` | Metrics port for the validator, used by the service and the service monitor |
| global.nodeSelector | object | `{}` | Node selector for the validator |
| global.podAnnotations | object | `{}` | Pod annotations for the validator |
| global.podSecurityContext | object | `{}` | Pod security context for the validator |
| global.readiness | object | `{"enabled":true,"readinessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}}` | Readiness probe : stop the validator if the metrics endpoint is not reachable |
| global.resources | object | `{}` | Resources constraints for the validator, CPU, Memory, etc. |
| global.securityContext | object | `{}` | Security context for the validator |
| global.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| global.serviceAccount.create | string | `"true"` | Specifies whether a service account should be created |
| global.serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| global.tolerations | list | `[]` | Tolerations applied validator |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"60s"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.port | string | `"metrics"` | port to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"60s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| tor-proxy | object | `{"enabled":true}` | Values for Tor Proxy (subchart of ghost) |
| tor-proxy.enabled | bool | `true` | values for tor-proxy, installs [tor-controller](/crds/tor-controller.yaml) and creates an [onionService CRD](/templates/tor-onion-service.yaml) |
| vao.argsOverride | list | `[]` | args override for the validator |
| vao.commandOverride | list | `[]` | command override for the validator |
| vao.env | object | `{"normal":{"CFG_DEFI_ENABLE":"0","CFG_VAO_ENABLE":"1"},"raw":{}}` | Environment variable listing |
| vao.env.normal | object | `{"CFG_DEFI_ENABLE":"0","CFG_VAO_ENABLE":"1"}` | un-encrypted env vars passed to the pod |
| vao.extraVolumes | list | `[]` | Extra volumes to mount (typically for secrets) |
| vao.service | object | `{"annotations":{},"ports":{"libp2p":{"port":8001,"protocol":"TCP"}},"type":"LoadBalancer"}` | Service type for the validator |
| vao.service.annotations | object | `{}` | Annotations to add to the service |
| vao.service.ports.libp2p | object | `{"port":8001,"protocol":"TCP"}` | libp2p port for the validator service |
| vao.service.type | string | `"LoadBalancer"` | Type of service for the validator, only `LoadBalancer` supported for now |
| vao.watchdogConfigReg | string | `"0x064358f9b6428C51F80511D73AFEb3A9e5Cf0213"` | WATCHDOG onchain config address |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
