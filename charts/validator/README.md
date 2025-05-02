# validator

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.58.0](https://img.shields.io/badge/AppVersion-0.58.0-informational?style=flat-square)

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
| ghost | object | `{"affinity":{},"argsOverride":[],"chainId":1,"chainName":"eth","chainTxType":"eip1559","commandOverride":[],"env":{"normal":{}},"ethConfig":{},"fullnameOverride":"ghost","image":{"pullPolicy":"Always","repository":"ghcr.io/chronicleprotocol/ghost","tag":"0.58.0@sha256:35addbb175ffaf5f241445ae4e3acba84ed854e2b93501630bb1bbc8318eb0c2"},"imagePullSecrets":[],"ingress":{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific","port":8000}]}],"tls":[]},"liveness":{"enabled":true,"livenessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}},"logFormat":"text","logLevel":"info","metrics":{"enabled":true,"port":9090},"nameOverride":"","nodeSelector":{},"podAnnotations":{},"podSecurityContext":{},"readiness":{"enabled":true,"readinessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}},"replicaCount":1,"resources":{},"rpcUrl":null,"securityContext":{},"service":{"annotations":{},"ports":{"libp2p":{"port":8000,"protocol":"TCP"},"webapi":{"port":8080,"protocol":"TCP"}},"type":"LoadBalancer"},"serviceAccount":{"annotations":{},"create":true,"name":""},"tolerations":[],"watchdogConfigReg":"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3","webApi":{"enabled":true,"listenAddr":"0.0.0.0:8080"}}` | Values for Ghost |
| ghost.affinity | object | `{}` | pod Affinity spec applied validator |
| ghost.argsOverride | list | `[]` | args override for the validator |
| ghost.chainId | int | `1` | chain id for the "target" or "main" chain we use for the validator. Can be mainnet ethereum `1` or sepolia ethereum `11155111` |
| ghost.chainName | string | `"eth"` | chain name for the "target" or "main" chain we use for the validator |
| ghost.chainTxType | string | `"eip1559"` | chain tx type for the "target" or "main" chain we use for the validator. Can be mainnet ethereum `eip1559` or `legacy` |
| ghost.commandOverride | list | `[]` | command override for the validator |
| ghost.env | object | `{"normal":{}}` | Environment variable listing |
| ghost.env.normal | object | `{}` | un-encrypted env vars passed to the pod |
| ghost.ethConfig | object | `{}` | Provide ETH keys from existing secrets : **NB** use only existing secret OR env vars, do not provide both |
| ghost.fullnameOverride | string | `"ghost"` | Override the release name to so tor-proxy can work with the default config. NB only change this if you know what you are doing |
| ghost.image.tag | string | `"0.58.0@sha256:35addbb175ffaf5f241445ae4e3acba84ed854e2b93501630bb1bbc8318eb0c2"` | Overrides the image tag whose default is the chart appVersion. |
| ghost.ingress | object | `{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific","port":8000}]}],"tls":[]}` | Ingress for the validator - we should start using it maybe??? |
| ghost.ingress.enabled | bool | `false` | Disabled by default, since there WAS a bug in libp2p port assignment for dns based routing |
| ghost.liveness | object | `{"enabled":true,"livenessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}}` | Liveness probe : restart the validator if the healthcheck endpoint is not reachable |
| ghost.logFormat | string | `"text"` | Log format for the validator, can be one of `json`, `text` |
| ghost.logLevel | string | `"info"` | Log level for the validator, can be one of `debug`, `info`, `warning`, `error` |
| ghost.nodeSelector | object | `{}` | Node selector for the validator |
| ghost.podAnnotations | object | `{}` | Pod annotations for the validator |
| ghost.podSecurityContext | object | `{}` | Pod security context for the validator |
| ghost.readiness | object | `{"enabled":true,"readinessProbe":{"httpGet":{"path":"/healthz","port":9100},"initialDelaySeconds":30,"periodSeconds":60}}` | Readiness probe : stop the validator if the metrics endpoint is not reachable |
| ghost.resources | object | `{}` | Resources constraints for the validator, CPU, Memory, etc. |
| ghost.rpcUrl | string | `nil` | RPC url for the "target" or "main" chain we use for the validator. Can be mainnet ethereum or sepolia ethereum |
| ghost.securityContext | object | `{}` | Security context for the validator |
| ghost.service | object | `{"annotations":{},"ports":{"libp2p":{"port":8000,"protocol":"TCP"},"webapi":{"port":8080,"protocol":"TCP"}},"type":"LoadBalancer"}` | Service type for the validator |
| ghost.service.annotations | object | `{}` | Annotations to add to the service |
| ghost.service.ports.libp2p | object | `{"port":8000,"protocol":"TCP"}` | libp2p port for the validator service |
| ghost.service.ports.webapi | object | `{"port":8080,"protocol":"TCP"}` | webapi listen port for the validator service |
| ghost.service.type | string | `"LoadBalancer"` | Type of service for the validator, can also be `LoadBalancer`, `NodePort` is experimental |
| ghost.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| ghost.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| ghost.serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| ghost.tolerations | list | `[]` | Tolerations applied validator |
| ghost.watchdogConfigReg | string | `"0x94Fea534aef6df5cF66C2DAE5CE0A05d10C068F3"` | WATCHDOG onchain config address |
| ghost.webApi | object | `{"enabled":true,"listenAddr":"0.0.0.0:8080"}` | WEB API (tor-proxy) |
| ghost.webApi.enabled | bool | `true` | Enables the web api and deploys the tor-proxy subchart |
| ghost.webApi.listenAddr | string | `"0.0.0.0:8080"` | Listen address for the web api |
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

