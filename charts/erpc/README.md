# erpc

![Version: 0.0.8](https://img.shields.io/badge/Version-0.0.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.23](https://img.shields.io/badge/AppVersion-0.0.23-informational?style=flat-square)

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
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | Enable autoscaling / HPA |
| env | object | `{}` | create env vars from secrets, eg RPC provider API keys (eg, Blast API, DRPC, Infura, Alchemy, etc. ) |
| erpc.cacheConfig | object | `{"driver":"memory"}` | provides a DB backend for caching. must be one of `memory`, `redis`, or `postgresql`. ref: https://docs.erpc.cloud/config/database |
| erpc.logLevel | string | `"info"` | Log level for eRPC. Must be one of `debug`, `info`, `warn`, `error`, `fatal`, or `panic`. |
| erpc.projects | list | `[{"authStrategies":{},"failsafe":{"circuitBreaker":{"failureThresholdCapacity":100,"failureThresholdCount":30,"halfOpenAfter":"120s","successThresholdCapacity":10,"successThresholdCount":8},"hedge":{"delay":"500ms","maxCount":2},"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"500ms","jitter":"500ms","maxCount":3}},"id":"testnet","networkIds":["421614","11155111"],"upstreams":[{"chainId":"421614","endpoint":"https://arbitrum-sepolia.public.blastapi.io","id":"arbsep-public-blast","rateLimitBudget":"freemium"},{"allowMethods":["eth_getLogs"],"autoIgnoreUnsupportedMethods":true,"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","failsafe":{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxCount":2},"timeout":{"duration":"15s"}},"id":"sep-public-node","ignoreMethods":["alchemy_*"],"jsonRpc":{"batchMaxSize":100,"batchMaxWait":"100ms","supportsBatch":true},"rateLimitAutoTune":{"adjustmentPeriod":"1m","decreaseFactor":0.9,"enabled":true,"errorRateThreshold":0.1,"increaseFactor":1.05,"maxBudget":10000,"minBudget":0},"rateLimitBudget":"freemium"}]}]` | Projects define the networks and chains that eRPC will proxy for. ref: https://docs.erpc.cloud/config/projects |
| erpc.projects[0] | object | `{"authStrategies":{},"failsafe":{"circuitBreaker":{"failureThresholdCapacity":100,"failureThresholdCount":30,"halfOpenAfter":"120s","successThresholdCapacity":10,"successThresholdCount":8},"hedge":{"delay":"500ms","maxCount":2},"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"500ms","jitter":"500ms","maxCount":3}},"id":"testnet","networkIds":["421614","11155111"],"upstreams":[{"chainId":"421614","endpoint":"https://arbitrum-sepolia.public.blastapi.io","id":"arbsep-public-blast","rateLimitBudget":"freemium"},{"allowMethods":["eth_getLogs"],"autoIgnoreUnsupportedMethods":true,"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","failsafe":{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxCount":2},"timeout":{"duration":"15s"}},"id":"sep-public-node","ignoreMethods":["alchemy_*"],"jsonRpc":{"batchMaxSize":100,"batchMaxWait":"100ms","supportsBatch":true},"rateLimitAutoTune":{"adjustmentPeriod":"1m","decreaseFactor":0.9,"enabled":true,"errorRateThreshold":0.1,"increaseFactor":1.05,"maxBudget":10000,"minBudget":0},"rateLimitBudget":"freemium"}]}` | each project must have a unique id, and is used in the URL structure: fqdn/{project_id}/{network-architecture}/{chain-id} |
| erpc.projects[0].authStrategies | object | `{}` | Apply auth to project level. ref: https://docs.erpc.cloud/config/auth |
| erpc.projects[0].failsafe.circuitBreaker.failureThresholdCount | int | `30` | These two variables indicate how many failures and capacity to tolerate before opening the circuit. |
| erpc.projects[0].failsafe.circuitBreaker.halfOpenAfter | string | `"120s"` | How long to wait before trying to re-enable the upstream after circuit breaker was opened. |
| erpc.projects[0].failsafe.circuitBreaker.successThresholdCount | int | `8` | These two variables indicate how many successes are required in half-open state before closing the circuit, and putting the upstream back in available upstreams. |
| erpc.projects[0].failsafe.hedge | object | `{"delay":"500ms","maxCount":2}` | Delay means how long to wait before starting a simultaneous hedged request. |
| erpc.projects[0].failsafe.hedge.delay | string | `"500ms"` | e.g. if upstream A did not respond within 500ms, a new request towards upstream B will be started, and whichever responds faster will be returned to the client. |
| erpc.projects[0].failsafe.hedge.maxCount | int | `2` | In total how many hedges to start. e.g. if maxCount is 2, and upstream A did not respond within 500ms, a new request towards upstream B will be started. If B also did not respond, a new request towards upstream C will be started. |
| erpc.projects[0].failsafe.retry | object | `{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"500ms","jitter":"500ms","maxCount":3}` | this is additional to the retry policy set on upstream level. |
| erpc.projects[0].failsafe.retry.backoffFactor | float | `0.3` | Multiplier for each retry for exponential backoff: |
| erpc.projects[0].failsafe.retry.backoffMaxDelay | string | `"10s"` | Maximum delay between retries: |
| erpc.projects[0].failsafe.retry.delay | string | `"500ms"` | Min delay between retries: |
| erpc.projects[0].failsafe.retry.jitter | string | `"500ms"` | Random jitter to avoid thundering herd, e.g. add between 0 to 500ms to each retry delay: |
| erpc.projects[0].failsafe.retry.maxCount | int | `3` | Total retries besides the initial request: |
| erpc.projects[0].networkIds | list | `["421614","11155111"]` | A network represents a chain in EVM, and it is a local grouping for upstreams. ref: https://docs.erpc.cloud/config/projects/networks |
| erpc.projects[0].upstreams | list | `[{"chainId":"421614","endpoint":"https://arbitrum-sepolia.public.blastapi.io","id":"arbsep-public-blast","rateLimitBudget":"freemium"},{"allowMethods":["eth_getLogs"],"autoIgnoreUnsupportedMethods":true,"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","failsafe":{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxCount":2},"timeout":{"duration":"15s"}},"id":"sep-public-node","ignoreMethods":["alchemy_*"],"jsonRpc":{"batchMaxSize":100,"batchMaxWait":"100ms","supportsBatch":true},"rateLimitAutoTune":{"adjustmentPeriod":"1m","decreaseFactor":0.9,"enabled":true,"errorRateThreshold":0.1,"increaseFactor":1.05,"maxBudget":10000,"minBudget":0},"rateLimitBudget":"freemium"}]` | A upstream is defined to handle 1 or more networks (a.k.a. chains). ref: https://docs.erpc.cloud/config/projects/upstreams |
| erpc.projects[0].upstreams[1].allowMethods | list | `["eth_getLogs"]` | Explicitly allowed methods will take precedence over ignoreMethods. For example if you only want eth_getLogs to be served, set ignore methods to "*" and allowMethods to "eth_getLogs". |
| erpc.projects[0].upstreams[1].failsafe | object | `{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxCount":2},"timeout":{"duration":"15s"}}` | [optional] - additional failsafe settings for this upstream |
| erpc.rateLimiters | list | `[{"id":"freemium","rules":[{"maxCount":100,"method":"*","period":"1s"}]},{"id":"premium","rules":[{"maxCount":1000,"method":"*","period":"2s"}]}]` | Define rate limiters for upstreams. ref: https://docs.erpc.cloud/config/projects/rate-limiters |
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
| replicaCount | int | `1` | Deployment replica count |
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
