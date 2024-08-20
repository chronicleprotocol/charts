# erpc

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.12](https://img.shields.io/badge/AppVersion-0.0.12-informational?style=flat-square)

A Helm chart for deploying eRPC — fault-tolerant evm rpc proxy with reorg-aware permanent caching to Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://chroniclelabs.org> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| env | object | `{}` | create env vars from secrets, eg RPC provider API keys (eg, Blast API, DRPC, Infura, Alchemy, etc. ) |
| erpc.cacheConfig.driver | string | `"memory"` |  |
| erpc.projects[0].id | string | `"main"` |  |
| erpc.projects[0].networkIds[0] | string | `"1"` |  |
| erpc.projects[0].networkIds[1] | string | `"42161"` |  |
| erpc.projects[1].id | string | `"testnet"` |  |
| erpc.projects[1].networkIds[0] | string | `"5"` |  |
| erpc.projects[1].networkIds[1] | string | `"111155111"` |  |
| erpc.rateLimiters[0].id | string | `"default-budget"` |  |
| erpc.rateLimiters[0].rules[0].maxCount | int | `10000` |  |
| erpc.rateLimiters[0].rules[0].method | string | `"*"` |  |
| erpc.rateLimiters[0].rules[0].period | string | `"1s"` |  |
| erpc.rateLimiters[1].id | string | `"global-blast"` |  |
| erpc.rateLimiters[1].rules[0].maxCount | int | `1000` |  |
| erpc.rateLimiters[1].rules[0].method | string | `"*"` |  |
| erpc.rateLimiters[1].rules[0].period | string | `"2s"` |  |
| erpc.rateLimiters[2].id | string | `"global-quicknode"` |  |
| erpc.rateLimiters[2].rules[0].maxCount | int | `300` |  |
| erpc.rateLimiters[2].rules[0].method | string | `"*"` |  |
| erpc.rateLimiters[2].rules[0].period | string | `"1s"` |  |
| erpc.upstreams[0].chainId | int | `1` |  |
| erpc.upstreams[0].endpoint | string | `"https://mainnet.infura.io/v3/yourInfuraApiKey"` |  |
| erpc.upstreams[0].id | string | `"eth-example-1"` |  |
| erpc.upstreams[0].rateLimit | string | `"default-budget"` |  |
| erpc.upstreams[1].chainId | int | `42161` |  |
| erpc.upstreams[1].endpoint | string | `"https://arb.infura.io/v3/yourInfuraApiKey"` |  |
| erpc.upstreams[1].id | string | `"arb1-example-1"` |  |
| erpc.upstreams[1].rateLimit | string | `"global-blast"` |  |
| erpc.upstreams[2].chainId | int | `5` |  |
| erpc.upstreams[2].endpoint | string | `"https://goerli.infura.io/v3/yourInfuraApiKey"` |  |
| erpc.upstreams[2].id | string | `"goerli-example-1"` |  |
| erpc.upstreams[2].rateLimit | string | `"global-quicknode"` |  |
| extraObjects | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/erpc/erpc"` |  |
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
| service.ports.http.port | int | `4000` |  |
| service.ports.http.protocol | string | `"TCP"` |  |
| service.ports.metrics.port | int | `4001` |  |
| service.ports.metrics.protocol | string | `"TCP"` |  |
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
