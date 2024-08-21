# erpc

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.12](https://img.shields.io/badge/AppVersion-0.0.12-informational?style=flat-square)

A Helm chart for deploying eRPC — fault-tolerant evm rpc proxy with reorg-aware permanent caching to Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://chroniclelabs.org> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 20.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| env | object | `{}` | create env vars from secrets, eg RPC provider API keys (eg, Blast API, DRPC, Infura, Alchemy, etc. ) |
| erpc.cacheConfig | object | `{"driver":"memory"}` | provides a DB backend for caching. must be one of `memory`, `redis`, or `postgresql`. ref: https://docs.erpc.cloud/config/database |
| erpc.projects | list | `[{"id":"testnet","networkIds":["421614","84532","80084","5003","11155420","534351","11155111","2442","300"],"upstreams":[{"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","id":"sep-public-node","rateLimit":"p2"},{"chainId":"11155111","endpoint":"https://eth-sepolia.public.blastapi.io","id":"sep-blast-node","rateLimit":"p2"},{"chainId":"300","endpoint":"https://zksync-sepolia.drpc.org","id":"zksync-sep-drpc","rateLimit":"p3"},{"chainId":5,"endpoint":"https://zksync-era-sepolia.blockpi.network/v1/rpc/public","id":"zksync-sep-blockpi","rateLimit":"p1"},{"endpoint":"envio://rpc.hypersync.xyz","id":"envio-public","rateLimit":"p2"}]}]` | Projects define the networks and chains that eRPC will proxy for. ref: https://docs.erpc.cloud/config/projects |
| erpc.projects[0] | object | `{"id":"testnet","networkIds":["421614","84532","80084","5003","11155420","534351","11155111","2442","300"],"upstreams":[{"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","id":"sep-public-node","rateLimit":"p2"},{"chainId":"11155111","endpoint":"https://eth-sepolia.public.blastapi.io","id":"sep-blast-node","rateLimit":"p2"},{"chainId":"300","endpoint":"https://zksync-sepolia.drpc.org","id":"zksync-sep-drpc","rateLimit":"p3"},{"chainId":5,"endpoint":"https://zksync-era-sepolia.blockpi.network/v1/rpc/public","id":"zksync-sep-blockpi","rateLimit":"p1"},{"endpoint":"envio://rpc.hypersync.xyz","id":"envio-public","rateLimit":"p2"}]}` | each project must have a unique id, and is used in the URL structure: fqdn/{project_id}/{network-architecture}/{chain-id} |
| erpc.projects[0].networkIds | list | `["421614","84532","80084","5003","11155420","534351","11155111","2442","300"]` | A network represents a chain in EVM, and it is a local grouping for upstreams. ref: https://docs.erpc.cloud/config/projects/networks |
| erpc.projects[0].upstreams | list | `[{"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","id":"sep-public-node","rateLimit":"p2"},{"chainId":"11155111","endpoint":"https://eth-sepolia.public.blastapi.io","id":"sep-blast-node","rateLimit":"p2"},{"chainId":"300","endpoint":"https://zksync-sepolia.drpc.org","id":"zksync-sep-drpc","rateLimit":"p3"},{"chainId":5,"endpoint":"https://zksync-era-sepolia.blockpi.network/v1/rpc/public","id":"zksync-sep-blockpi","rateLimit":"p1"},{"endpoint":"envio://rpc.hypersync.xyz","id":"envio-public","rateLimit":"p2"}]` | A upstream is defined to handle 1 or more networks (a.k.a. chains). ref: https://docs.erpc.cloud/config/projects/upstreams |
| erpc.projects[0].upstreams[4] | object | `{"endpoint":"envio://rpc.hypersync.xyz","id":"envio-public","rateLimit":"p2"}` | Ref: https://docs.erpc.cloud/config/projects/upstreams#envio-json-rpc |
| erpc.rateLimiters | list | `[{"id":"p3","rules":[{"maxCount":10000,"method":"*","period":"1s"}]},{"id":"p2","rules":[{"maxCount":1000,"method":"*","period":"2s"}]},{"id":"p1","rules":[{"maxCount":300,"method":"*","period":"1s"}]}]` | Define rate limiters for upstreams. ref: https://docs.erpc.cloud/config/projects/rate-limiters |
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
| redis.master.persistence.enabled | bool | `false` |  |
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
| serviceMonitor | object | `{"annotations":{},"enabled":false,"interval":"1m","labels":{},"namespace":null,"path":"/metrics","port":"metrics","relabelings":[],"scheme":"http","scrapeTimeout":"30s","tlsConfig":{}}` | If true, create a ServiceMonitor CRD for prometheus operator |
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
