# rpc-router

![Version: 0.2.8](https://img.shields.io/badge/Version-0.2.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.54.0](https://img.shields.io/badge/AppVersion-0.54.0-informational?style=flat-square)

A Helm chart for deploying p2p-org Dshackle - Fault Tolerant Load Balancer for Blockchain API, to Kubernetes,

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://chroniclelabs.org> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 16.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| dshackle | object | `{"accessLog":{"enabled":false,"includeMessages":false},"compression":{"grpc":{"client":{"enabled":false},"server":{"enabled":false}}},"health":{"host":"0.0.0.0"},"metrics":{"bind":"0.0.0.0","enabled":true,"extended":false,"jvm":false,"path":"/metrics"},"proxy":{"preserveBatchOrder":false},"routes":[{"blockchain":"ethereum","id":"eth","upstreams":[{"disableValidation":false,"id":"blast-eth","labels":{"fullnode":true,"provider":"publicnode"},"method_whitelist":["eth_maxPriorityFeePerGas"],"role":"primary","url":"https://eth-mainnet.public.blastapi.io","validateCallLimit":false,"validatePeers":false,"validateSyncing":true,"validationInterval":"500"},{"disableValidation":false,"id":"drpc-eth","labels":{"archive":true,"provider":"drpc"},"role":"fallback","url":"https://eth.drpc.org","validateCallLimit":false,"validatePeers":false,"validateSyncing":true}]}],"signedResponse":false}` | Ref: https://github.com/p2p-org/dshackle/blob/master/docs/reference-configuration.adoc |
| dshackle.accessLog.enabled | bool | `false` | enable access log, expensive so use only to debug |
| dshackle.accessLog.includeMessages | bool | `false` | include messages in the access log |
| dshackle.metrics | object | `{"bind":"0.0.0.0","enabled":true,"extended":false,"jvm":false,"path":"/metrics"}` | enable metrics for dshackle |
| dshackle.metrics.bind | string | `"0.0.0.0"` | host bind address |
| dshackle.metrics.enabled | bool | `true` | enable metrics for dshackle |
| dshackle.metrics.extended | bool | `false` | collect extended metrics |
| dshackle.metrics.jvm | bool | `false` | collect jvm metrics |
| dshackle.metrics.path | string | `"/metrics"` | path to metrics |
| dshackle.proxy.preserveBatchOrder | bool | `false` | Should proxy preserve request-response correspondence when sending batch request via http |
| dshackle.routes[0] | object | `{"blockchain":"ethereum","id":"eth","upstreams":[{"disableValidation":false,"id":"blast-eth","labels":{"fullnode":true,"provider":"publicnode"},"method_whitelist":["eth_maxPriorityFeePerGas"],"role":"primary","url":"https://eth-mainnet.public.blastapi.io","validateCallLimit":false,"validatePeers":false,"validateSyncing":true,"validationInterval":"500"},{"disableValidation":false,"id":"drpc-eth","labels":{"archive":true,"provider":"drpc"},"role":"fallback","url":"https://eth.drpc.org","validateCallLimit":false,"validatePeers":false,"validateSyncing":true}]}` | the http path the chain is configured on (eg, /eth, /bsc, /matic, etc.), Route id must be alphanumeric and lowercase |
| dshackle.routes[0].upstreams | list | `[{"disableValidation":false,"id":"blast-eth","labels":{"fullnode":true,"provider":"publicnode"},"method_whitelist":["eth_maxPriorityFeePerGas"],"role":"primary","url":"https://eth-mainnet.public.blastapi.io","validateCallLimit":false,"validatePeers":false,"validateSyncing":true,"validationInterval":"500"},{"disableValidation":false,"id":"drpc-eth","labels":{"archive":true,"provider":"drpc"},"role":"fallback","url":"https://eth.drpc.org","validateCallLimit":false,"validatePeers":false,"validateSyncing":true}]` | upstreams are the RPC providers |
| dshackle.routes[0].upstreams[0] | object | `{"disableValidation":false,"id":"blast-eth","labels":{"fullnode":true,"provider":"publicnode"},"method_whitelist":["eth_maxPriorityFeePerGas"],"role":"primary","url":"https://eth-mainnet.public.blastapi.io","validateCallLimit":false,"validatePeers":false,"validateSyncing":true,"validationInterval":"500"}` | id is the unique name of the upstream (eg eth-infura, usa-east-1-eth, eth-alchemy, etc.) |
| dshackle.routes[0].upstreams[0].disableValidation | bool | `false` | disableValidation (optional) is used to disable the validation of the RPC provider, default is false |
| dshackle.routes[0].upstreams[0].labels | object | `{"fullnode":true,"provider":"publicnode"}` | add additional labels to the upstream. |
| dshackle.routes[0].upstreams[0].method_whitelist | list | `["eth_maxPriorityFeePerGas"]` | add additional method whitelist to the upstream |
| dshackle.routes[0].upstreams[0].role | string | `"primary"` | role can be on of primary, secondary or fallback. default is primary |
| dshackle.routes[0].upstreams[0].url | string | `"https://eth-mainnet.public.blastapi.io"` | RPC (http) url is the RPC provider endpoint |
| dshackle.routes[0].upstreams[0].validateCallLimit | bool | `false` | validateCallLimit (optional) is used to validate the call limit of the RPC provider, default is true |
| dshackle.routes[0].upstreams[0].validatePeers | bool | `false` | validatePeers (optional) is used to validate the peers of the RPC provider, default is true |
| dshackle.routes[0].upstreams[0].validateSyncing | bool | `true` | validateSyncing (optional) is used to validate the syncing of the RPC provider, default is true |
| dshackle.routes[0].upstreams[0].validationInterval | string | `"500"` | validationInterval (optional) is used to validate the call limit of the RPC provider, default is 30 |
| dshackle.routes[0].upstreams[1].disableValidation | bool | `false` | disableValidation (optional) is used to disable the validation of the RPC provider, default is false |
| dshackle.routes[0].upstreams[1].labels | object | `{"archive":true,"provider":"drpc"}` | add additional labels to the upstream |
| dshackle.routes[0].upstreams[1].role | string | `"fallback"` | role can be on of primary, secondary or fallback. default is primary |
| dshackle.routes[0].upstreams[1].url | string | `"https://eth.drpc.org"` | RPC (http) url is the RPC provider endpoint |
| dshackle.routes[0].upstreams[1].validateCallLimit | bool | `false` | validateCallLimit (optional) is used to validate the call limit of the RPC provider, default is true |
| dshackle.routes[0].upstreams[1].validatePeers | bool | `false` | validatePeers (optional) is used to validate the peers of the RPC provider, default is true |
| dshackle.routes[0].upstreams[1].validateSyncing | bool | `true` | validateSyncing (optional) is used to validate the syncing of the RPC provider, default is true |
| env | list | `[{"name":"HEAP_DUMP_ENABLE","value":"true"},{"name":"HEAP_DUMP_PATH","value":"/tmp"},{"name":"DSHACKLE_LOG_LEVEL","value":"info"}]` | create env vars from secrets, eg RPC provider API keys (eg, Blast API, DRPC, Infura, Alchemy, etc. ) |
| env[2] | object | `{"name":"DSHACKLE_LOG_LEVEL","value":"info"}` | log level can be debug, info, warn, error, trace etc. |
| fullnameOverride | string | `""` |  |
| global_method_whitelist | list | `[]` | global method whitelist applied to all upstreams |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"drpcorg/dshackle"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| maxSurge | string | `nil` | default is 1 |
| maxUnavailable | string | `nil` | default is 0 |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| preStopSleepSeconds | string | `nil` | default is 20 seconds |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| redis.auth.password | string | `"yourRedisSecret"` |  |
| redis.enabled | bool | `false` | If enabled a redis chart will be deployed as a dependency |
| redis.master.persistence.enabled | bool | `true` |  |
| redis.master.persistence.size | string | `"8Gi"` |  |
| redis.replica.persistence.enabled | bool | `false` |  |
| redis.replica.persistence.size | string | `"8Gi"` |  |
| redis.replica.replicaCount | int | `1` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.ports.grpc.port | int | `12448` |  |
| service.ports.grpc.protocol | string | `"TCP"` |  |
| service.ports.health.port | int | `8082` |  |
| service.ports.health.protocol | string | `"TCP"` |  |
| service.ports.metrics | object | `{"port":8080,"protocol":"TCP"}` | metrics port, affects the .Values.dshackle.metrics |
| service.ports.proxy.port | int | `8545` |  |
| service.ports.proxy.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"1m"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.port | string | `"metrics"` | port to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| tolerations | list | `[]` |  |
| updateStrategy | string | `nil` | default RollingUpdate |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
