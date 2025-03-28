# spectre

![Version: 0.3.3](https://img.shields.io/badge/Version-0.3.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.42.2](https://img.shields.io/badge/AppVersion-0.42.2-informational?style=flat-square)

A Helm chart for deploying Chronicle Spectre Relay on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake/> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| argsOverride | list | `[]` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| chainId | string | `nil` | must match target chain |
| chainType | string | `nil` | can be one of mainnet: `eth`, `arb`, `opt`, `gno`, `scr`, `zkevm`, `mantle`, or testnets: `gor`, `sep`, `ogor`, `mango`, `testnet-zkEVM-mango`, `mantle-testnet`, `scr-sepolia` |
| configsUrl | string | `""` | config url for the app, if provided, will override the default config. can be an ipfs url or a http url |
| entryPointOverride | list | `[]` |  |
| env.normal.CFG_WEBAPI_ENABLE | int | `1` |  |
| env.normal.CFG_WEBAPI_ETH_ADDR_BOOK | string | `""` |  |
| env.normal.CFG_WEBAPI_LISTEN_ADDR | string | `":8080"` |  |
| env.normal.CFG_WEBAPI_SOCKS5_PROXY_ADDR | string | `""` |  |
| env.normal.CFG_WEBAPI_STATIC_ADDR_BOOK | string | `""` |  |
| environment | string | `"stage"` | CFG_ENVIRONMENT can be one of `stage` or `prod` |
| ethConfig | object | `{}` |  |
| extraObjects | list | `[]` | Extra K8s manifests to deploy |
| fullnameOverride | string | `"spectre"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/chronicleprotocol/spectre"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| inlineConfig | string | `""` |  |
| livenessProbe.enabled | bool | `false` |  |
| livenessProbe.probeSpec.failureThreshold | int | `3` |  |
| livenessProbe.probeSpec.httpGet.path | string | `"/healthz"` |  |
| livenessProbe.probeSpec.httpGet.port | string | `"listen"` |  |
| livenessProbe.probeSpec.initialDelaySeconds | int | `30` |  |
| livenessProbe.probeSpec.periodSeconds | int | `10` |  |
| livenessProbe.probeSpec.successThreshold | int | `1` |  |
| livenessProbe.probeSpec.timeoutSeconds | int | `5` |  |
| logFormat | string | `nil` |  |
| logLevel | string | `nil` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.enabled | bool | `false` |  |
| readinessProbe.probeSpec.failureThreshold | int | `3` |  |
| readinessProbe.probeSpec.httpGet.path | string | `"/healthz"` |  |
| readinessProbe.probeSpec.httpGet.port | string | `"listen"` |  |
| readinessProbe.probeSpec.initialDelaySeconds | int | `30` |  |
| readinessProbe.probeSpec.periodSeconds | int | `10` |  |
| readinessProbe.probeSpec.successThreshold | int | `1` |  |
| readinessProbe.probeSpec.timeoutSeconds | int | `5` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| rpcUrl | string | `nil` | rpcUrl for the target chain |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.ports.listen.port | int | `8080` |  |
| service.ports.listen.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
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
| tolerations | list | `[]` |  |
| tor-proxy.enabled | bool | `true` | values for tor-proxy, installs [tor-controller](/crds/tor-controller.yaml) and creates an [onionService CRD](/templates/onion-service.yaml) |
| txType | string | `nil` | can be one of `legacy`or `eip1559` |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
