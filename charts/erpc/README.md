# erpc

![Version: 0.6.1](https://img.shields.io/badge/Version-0.6.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.61](https://img.shields.io/badge/AppVersion-0.0.61-informational?style=flat-square)

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
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | Enable autoscaling / HPA |
| env | object | `{}` | create env vars from secrets, eg RPC provider API keys (eg, Blast API, DRPC, Infura, Alchemy, etc. ) |
| erpc | object | `{"database":{"evmJsonRpcCache":{"connectors":[{"driver":"memory","id":"memory-cache","memory":{"maxItems":100000}}],"policies":[{"connector":"memory-cache","finality":"finalized","method":"*","network":"*","ttl":0},{"connector":"memory-cache","finality":"unfinalized","maxItemSize":"1MB","method":"*","network":"*","ttl":"5s"},{"connector":"memory-cache","finality":"unknown","method":"*","network":"*","ttl":"5s"}]}},"logLevel":"warn","metrics":{"enabled":true,"hostV4":"0.0.0.0","hostV6":"[::]","listenV4":true,"listenV6":false,"port":4001},"projects":[{"id":"main","networks":[{"architecture":"evm","evm":{"chainId":1},"failsafe":[{"circuitBreaker":{"failureThresholdCapacity":200,"failureThresholdCount":160,"halfOpenAfter":"5m","successThresholdCapacity":3,"successThresholdCount":3},"hedge":{"delay":"500ms","maxCount":1},"matchMethod":"*","retry":{"delay":"0ms","maxAttempts":3},"timeout":{"duration":"30s"}}]},{"architecture":"evm","evm":{"chainId":42161},"failsafe":[{"hedge":{"delay":"500ms","maxCount":1},"matchMethod":"*","retry":{"delay":"0ms","maxAttempts":3},"timeout":{"duration":"30s"}}]}],"rateLimitBudget":"frontend-budget","upstreams":[{"endpoint":"https://arb1.arbitrum.io/rpc","evm":{"chainId":42161},"failsafe":[{"matchMethod":"*","retry":{"backoffFactor":1.2,"backoffMaxDelay":"3s","delay":"500ms","jitter":"0ms","maxAttempts":2},"timeout":{"duration":"15s"}}],"id":"public-arb1","ignoreMethods":["alchemy_*","eth_traceTransaction"],"rateLimitBudget":"default-budget","type":"evm"},{"endpoint":"https://ethereum-rpc.publicnode.com","evm":{"chainId":1},"failsafe":[{"matchMethod":"*","retry":{"backoffFactor":1.2,"backoffMaxDelay":"3s","delay":"500ms","jitter":"0ms","maxAttempts":2},"timeout":{"duration":"15s"}}],"id":"public-eth","rateLimitBudget":"public-node","type":"evm"}]}],"rateLimiters":{"budgets":[{"id":"global","rules":[{"maxCount":20000,"method":"*","period":"1s","waitTime":"1s"}]},{"id":"default-budget","rules":[{"maxCount":10000,"method":"*","period":"1s","waitTime":"100ms"}]},{"id":"global-blast","rules":[{"maxCount":1000,"method":"*","period":"1s"}]},{"id":"public-node","rules":[{"maxCount":300,"method":"*","period":"1s"}]},{"id":"frontend-budget","rules":[{"maxCount":500,"method":"*","period":"1s"}]}]},"server":{"enableGzip":true,"httpHostV4":"0.0.0.0","httpHostV6":"[::]","httpPort":4000,"listenV4":true,"listenV6":false,"maxTimeout":"30s","readTimeout":"10s","tls":{"caFile":"/path/to/ca.pem","certFile":"/path/to/cert.pem","enabled":false,"insecureSkipVerify":false,"keyFile":"/path/to/key.pem"},"waitAfterShutdown":"30s","waitBeforeShutdown":"30s","writeTimeout":"20s"}}` | eRPC configuration, ref: https://docs.erpc.cloud/config/example#full-config-example; accepts full erpc.yaml config |
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
| readinessProbe | object | See `values.yaml` | Readiness probe |
| replicaCount | int | `1` | Deployment replica count |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
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
| startupProbe | object | See `values.yaml` | Startup probe. Once this succeeds, the liveness probe takes over. |
| terminationGracePeriodSeconds | int | `70` | The duration in seconds the pod needs to terminate gracefully. This should be greater than the sum of erpc.server.waitBeforeShutdown and erpc.server.waitAfterShutdown to allow the application to shut down cleanly. |
| tolerations | list | `[]` |  |
| updateStrategy | string | `nil` | default RollingUpdate |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
