# erpc

![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.41](https://img.shields.io/badge/AppVersion-0.0.41-informational?style=flat-square)

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
| erpc | object | `{"admin":{"auth":{"strategies":[{"secret":{"value":"mysecret"},"type":"secret"}]}},"cacheConfig":{"connectors":[{"driver":"memory","id":"memory-cache"}],"policies":[{"connector":"memory-cache","empty":"allow","finality":"finalized","maxItemSize":"10Mb","method":"*","minItemSize":"1Mb","network":"*","params":[],"ttl":0},{"connector":"memory-cache","empty":"ignore","finality":"unfinalized","method":"*","network":"*","ttl":"5s"},{"connector":"memory-cache","empty":"ignore","finality":"unknown","method":"*","network":"*","ttl":"10s"},{"connector":"memory-cache","empty":"ignore","finality":"realtime","method":"*","network":"*","ttl":"2s"}]},"disableCache":false,"logLevel":"info","metrics":{"enabled":true,"hostV4":"0.0.0.0","hostV6":"[::]","listenV4":true,"listenV6":false,"port":4001},"projects":[{"authStrategies":{},"id":"main","networkDefaults":{"evm":{"integrity":{"enforceGetLogsBlockRange":true,"enforceHighestBlock":true}},"failsafe":{"hedge":{"maxCount":3,"quantile":0.99},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"1s","delay":"100ms","jitter":"0ms","maxAttempts":3},"timeout":{"duration":"30s"}}},"networkFailsafe":{},"networkIds":["1","11155111"],"selectionPolicy":{"evalFunction":"(upstreams, method) => {\n\n  const defaults = upstreams.filter(u => u.config.group !== 'fallback')\n  const fallbacks = upstreams.filter(u => u.config.group === 'fallback')\n\n  // Maximum allowed error rate.\n  const maxErrorRate = parseFloat(process.env.ROUTING_POLICY_MAX_ERROR_RATE || '0.7')\n\n  // Maximum allowed block head lag.\n  const maxBlockHeadLag = parseFloat(process.env.ROUTING_POLICY_MAX_BLOCK_HEAD_LAG || '10')\n\n  // Minimum number of healthy upstreams that must be included in default group.\n  const minHealthyThreshold = parseInt(process.env.ROUTING_POLICY_MIN_HEALTHY_THRESHOLD || '1')\n\n  // Filter upstreams that are healthy based on error rate and block head lag.\n  const healthyOnes = defaults.filter(\n    u => u.metrics.errorRate < maxErrorRate && u.metrics.blockHeadLag < maxBlockHeadLag\n  )\n\n  // If there are enough healthy upstreams, return them.\n  if (healthyOnes.length >= minHealthyThreshold) {\n    return healthyOnes\n  }\n\n  // The reason all upstreams are returned is to be less harsh and still consider default nodes (in case they have intermittent issues)\n  // Order of upstreams does not matter as that will be decided by the upstream scoring mechanism\n  return upstreams\n}\n","evalInterval":"1m","evalPerMethod":false,"resampleCount":100,"resampleExcluded":false,"resampleInterval":"5m"},"upstreamDefaults":{"allowMethods":["eth_getLogs"],"failsafe":{"circuitBreaker":{"failureThresholdCapacity":200,"failureThresholdCount":160,"halfOpenAfter":"5m","successThresholdCapacity":3,"successThresholdCount":3},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"5s","delay":"300ms","jitter":"100ms","maxAttempts":3},"timeout":{"duration":"15s"}},"group":"default","ignoreMethods":["eth_traceTransaction","alchemy_*"],"jsonRpc":{"batchMaxSize":10,"batchMaxWait":"50ms","supportsBatch":true}},"upstreams":[{"chainId":1,"endpoint":"https://eth-mainnet.public.blastapi.io","group":"fallback","id":"eth-public-blast","maxAvailableRecentBlocks":128,"nodeType":"full","rateLimitBudget":"freemium","statePollerInterval":"30s"},{"allowMethods":["eth_getLogs"],"autoIgnoreUnsupportedMethods":true,"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","failsafe":{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxAttempts":2},"timeout":{"duration":"15s"}},"headers":{"SomeHeader":"Bearer mytoken"},"id":"sep-public-node","ignoreMethods":["alchemy_*"],"jsonRpc":{"batchMaxSize":100,"batchMaxWait":"100ms","supportsBatch":true},"rateLimitAutoTune":{"adjustmentPeriod":"1m","decreaseFactor":0.9,"enabled":true,"errorRateThreshold":0.1,"increaseFactor":1.05,"maxBudget":10000,"minBudget":0},"rateLimitBudget":"freemium"}]}],"rateLimiters":[{"id":"freemium","rules":[{"maxCount":100,"method":"*","period":"1s"}]},{"id":"premium","rules":[{"maxCount":1000,"method":"*","period":"2s"}]}],"server":{"enableGzip":true,"httpHostV4":"0.0.0.0","httpHostV6":"[::]","httpPort":4000,"listenV4":true,"listenV6":false,"maxTimeout":"30s","readTimeout":"10s","tls":{"caFile":"/path/to/ca.pem","certFile":"/path/to/cert.pem","enabled":false,"insecureSkipVerify":false,"keyFile":"/path/to/key.pem"},"writeTimeout":"20s"},"sharedState":{}}` | eRPC configuration, ref: https://docs.erpc.cloud/config/example#full-config-example |
| erpc.admin | object | `{"auth":{"strategies":[{"secret":{"value":"mysecret"},"type":"secret"}]}}` | If enabled, the admin API will be enabled ref: |
| erpc.cacheConfig.connectors | list | `[{"driver":"memory","id":"memory-cache"}]` | can provide multiple connectors |
| erpc.cacheConfig.policies | list | `[{"connector":"memory-cache","empty":"allow","finality":"finalized","maxItemSize":"10Mb","method":"*","minItemSize":"1Mb","network":"*","params":[],"ttl":0},{"connector":"memory-cache","empty":"ignore","finality":"unfinalized","method":"*","network":"*","ttl":"5s"},{"connector":"memory-cache","empty":"ignore","finality":"unknown","method":"*","network":"*","ttl":"10s"},{"connector":"memory-cache","empty":"ignore","finality":"realtime","method":"*","network":"*","ttl":"2s"}]` | can provide multiple policies to work with all connectors configured |
| erpc.cacheConfig.policies[0] | object | `{"connector":"memory-cache","empty":"allow","finality":"finalized","maxItemSize":"10Mb","method":"*","minItemSize":"1Mb","network":"*","params":[],"ttl":0}` | Example: Cache all methods with finalized data including empty responses |
| erpc.cacheConfig.policies[1] | object | `{"connector":"memory-cache","empty":"ignore","finality":"unfinalized","method":"*","network":"*","ttl":"5s"}` | Example: Cache unfinalized data only for 5 seconds (getLogs of a recent block) except empty responses |
| erpc.cacheConfig.policies[2] | object | `{"connector":"memory-cache","empty":"ignore","finality":"unknown","method":"*","network":"*","ttl":"10s"}` | Example: Cache unknown finalization data (eth_trace*) only for 10 seconds |
| erpc.cacheConfig.policies[3] | object | `{"connector":"memory-cache","empty":"ignore","finality":"realtime","method":"*","network":"*","ttl":"2s"}` | Example: Cache realtime data only for 2 seconds (eth_blockNumber, eth_gasPrice, etc) to reduce costs yet fresh enough data |
| erpc.disableCache | bool | `false` | provides a DB backend for caching. must be one of `memory`, `redis`, or `postgresql`. ref: https://docs.erpc.cloud/config/database/drivers |
| erpc.logLevel | string | `"info"` | Log level for eRPC. Must be one of `debug`, `info`, `warn`, `error`, `fatal`, or `panic`. |
| erpc.metrics | object | `{"enabled":true,"hostV4":"0.0.0.0","hostV6":"[::]","listenV4":true,"listenV6":false,"port":4001}` | eRPC Metrics configuration, ref: https://docs.erpc.cloud/config/example#full-config-example |
| erpc.projects | list | `[{"authStrategies":{},"id":"main","networkDefaults":{"evm":{"integrity":{"enforceGetLogsBlockRange":true,"enforceHighestBlock":true}},"failsafe":{"hedge":{"maxCount":3,"quantile":0.99},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"1s","delay":"100ms","jitter":"0ms","maxAttempts":3},"timeout":{"duration":"30s"}}},"networkFailsafe":{},"networkIds":["1","11155111"],"selectionPolicy":{"evalFunction":"(upstreams, method) => {\n\n  const defaults = upstreams.filter(u => u.config.group !== 'fallback')\n  const fallbacks = upstreams.filter(u => u.config.group === 'fallback')\n\n  // Maximum allowed error rate.\n  const maxErrorRate = parseFloat(process.env.ROUTING_POLICY_MAX_ERROR_RATE || '0.7')\n\n  // Maximum allowed block head lag.\n  const maxBlockHeadLag = parseFloat(process.env.ROUTING_POLICY_MAX_BLOCK_HEAD_LAG || '10')\n\n  // Minimum number of healthy upstreams that must be included in default group.\n  const minHealthyThreshold = parseInt(process.env.ROUTING_POLICY_MIN_HEALTHY_THRESHOLD || '1')\n\n  // Filter upstreams that are healthy based on error rate and block head lag.\n  const healthyOnes = defaults.filter(\n    u => u.metrics.errorRate < maxErrorRate && u.metrics.blockHeadLag < maxBlockHeadLag\n  )\n\n  // If there are enough healthy upstreams, return them.\n  if (healthyOnes.length >= minHealthyThreshold) {\n    return healthyOnes\n  }\n\n  // The reason all upstreams are returned is to be less harsh and still consider default nodes (in case they have intermittent issues)\n  // Order of upstreams does not matter as that will be decided by the upstream scoring mechanism\n  return upstreams\n}\n","evalInterval":"1m","evalPerMethod":false,"resampleCount":100,"resampleExcluded":false,"resampleInterval":"5m"},"upstreamDefaults":{"allowMethods":["eth_getLogs"],"failsafe":{"circuitBreaker":{"failureThresholdCapacity":200,"failureThresholdCount":160,"halfOpenAfter":"5m","successThresholdCapacity":3,"successThresholdCount":3},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"5s","delay":"300ms","jitter":"100ms","maxAttempts":3},"timeout":{"duration":"15s"}},"group":"default","ignoreMethods":["eth_traceTransaction","alchemy_*"],"jsonRpc":{"batchMaxSize":10,"batchMaxWait":"50ms","supportsBatch":true}},"upstreams":[{"chainId":1,"endpoint":"https://eth-mainnet.public.blastapi.io","group":"fallback","id":"eth-public-blast","maxAvailableRecentBlocks":128,"nodeType":"full","rateLimitBudget":"freemium","statePollerInterval":"30s"},{"allowMethods":["eth_getLogs"],"autoIgnoreUnsupportedMethods":true,"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","failsafe":{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxAttempts":2},"timeout":{"duration":"15s"}},"headers":{"SomeHeader":"Bearer mytoken"},"id":"sep-public-node","ignoreMethods":["alchemy_*"],"jsonRpc":{"batchMaxSize":100,"batchMaxWait":"100ms","supportsBatch":true},"rateLimitAutoTune":{"adjustmentPeriod":"1m","decreaseFactor":0.9,"enabled":true,"errorRateThreshold":0.1,"increaseFactor":1.05,"maxBudget":10000,"minBudget":0},"rateLimitBudget":"freemium"}]}]` | Projects define the networks and chains that eRPC will proxy for. ref: https://docs.erpc.cloud/config/projects |
| erpc.projects[0] | object | `{"authStrategies":{},"id":"main","networkDefaults":{"evm":{"integrity":{"enforceGetLogsBlockRange":true,"enforceHighestBlock":true}},"failsafe":{"hedge":{"maxCount":3,"quantile":0.99},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"1s","delay":"100ms","jitter":"0ms","maxAttempts":3},"timeout":{"duration":"30s"}}},"networkFailsafe":{},"networkIds":["1","11155111"],"selectionPolicy":{"evalFunction":"(upstreams, method) => {\n\n  const defaults = upstreams.filter(u => u.config.group !== 'fallback')\n  const fallbacks = upstreams.filter(u => u.config.group === 'fallback')\n\n  // Maximum allowed error rate.\n  const maxErrorRate = parseFloat(process.env.ROUTING_POLICY_MAX_ERROR_RATE || '0.7')\n\n  // Maximum allowed block head lag.\n  const maxBlockHeadLag = parseFloat(process.env.ROUTING_POLICY_MAX_BLOCK_HEAD_LAG || '10')\n\n  // Minimum number of healthy upstreams that must be included in default group.\n  const minHealthyThreshold = parseInt(process.env.ROUTING_POLICY_MIN_HEALTHY_THRESHOLD || '1')\n\n  // Filter upstreams that are healthy based on error rate and block head lag.\n  const healthyOnes = defaults.filter(\n    u => u.metrics.errorRate < maxErrorRate && u.metrics.blockHeadLag < maxBlockHeadLag\n  )\n\n  // If there are enough healthy upstreams, return them.\n  if (healthyOnes.length >= minHealthyThreshold) {\n    return healthyOnes\n  }\n\n  // The reason all upstreams are returned is to be less harsh and still consider default nodes (in case they have intermittent issues)\n  // Order of upstreams does not matter as that will be decided by the upstream scoring mechanism\n  return upstreams\n}\n","evalInterval":"1m","evalPerMethod":false,"resampleCount":100,"resampleExcluded":false,"resampleInterval":"5m"},"upstreamDefaults":{"allowMethods":["eth_getLogs"],"failsafe":{"circuitBreaker":{"failureThresholdCapacity":200,"failureThresholdCount":160,"halfOpenAfter":"5m","successThresholdCapacity":3,"successThresholdCount":3},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"5s","delay":"300ms","jitter":"100ms","maxAttempts":3},"timeout":{"duration":"15s"}},"group":"default","ignoreMethods":["eth_traceTransaction","alchemy_*"],"jsonRpc":{"batchMaxSize":10,"batchMaxWait":"50ms","supportsBatch":true}},"upstreams":[{"chainId":1,"endpoint":"https://eth-mainnet.public.blastapi.io","group":"fallback","id":"eth-public-blast","maxAvailableRecentBlocks":128,"nodeType":"full","rateLimitBudget":"freemium","statePollerInterval":"30s"},{"allowMethods":["eth_getLogs"],"autoIgnoreUnsupportedMethods":true,"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","failsafe":{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxAttempts":2},"timeout":{"duration":"15s"}},"headers":{"SomeHeader":"Bearer mytoken"},"id":"sep-public-node","ignoreMethods":["alchemy_*"],"jsonRpc":{"batchMaxSize":100,"batchMaxWait":"100ms","supportsBatch":true},"rateLimitAutoTune":{"adjustmentPeriod":"1m","decreaseFactor":0.9,"enabled":true,"errorRateThreshold":0.1,"increaseFactor":1.05,"maxBudget":10000,"minBudget":0},"rateLimitBudget":"freemium"}]}` | each project must have a unique id, and is used in the URL structure: fqdn/{project_id}/{network-architecture}/{chain-id} |
| erpc.projects[0].authStrategies | object | `{}` | Apply auth to project level. ref: https://docs.erpc.cloud/config/auth |
| erpc.projects[0].networkDefaults | object | `{"evm":{"integrity":{"enforceGetLogsBlockRange":true,"enforceHighestBlock":true}},"failsafe":{"hedge":{"maxCount":3,"quantile":0.99},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"1s","delay":"100ms","jitter":"0ms","maxAttempts":3},"timeout":{"duration":"30s"}}}` | Network defaults enable for all networks |
| erpc.projects[0].networkIds | list | `["1","11155111"]` | A network represents a chain in EVM, and it is a local grouping for upstreams. ref: https://docs.erpc.cloud/config/projects/networks |
| erpc.projects[0].upstreamDefaults.failsafe | object | `{"circuitBreaker":{"failureThresholdCapacity":200,"failureThresholdCount":160,"halfOpenAfter":"5m","successThresholdCapacity":3,"successThresholdCount":3},"retry":{"backoffFactor":1.5,"backoffMaxDelay":"5s","delay":"300ms","jitter":"100ms","maxAttempts":3},"timeout":{"duration":"15s"}}` | Default failsafe policies |
| erpc.projects[0].upstreamDefaults.group | string | `"default"` | Default group for all upstreams |
| erpc.projects[0].upstreamDefaults.jsonRpc | object | `{"batchMaxSize":10,"batchMaxWait":"50ms","supportsBatch":true}` | Default JSON-RPC settings |
| erpc.projects[0].upstreams | list | `[{"chainId":1,"endpoint":"https://eth-mainnet.public.blastapi.io","group":"fallback","id":"eth-public-blast","maxAvailableRecentBlocks":128,"nodeType":"full","rateLimitBudget":"freemium","statePollerInterval":"30s"},{"allowMethods":["eth_getLogs"],"autoIgnoreUnsupportedMethods":true,"chainId":"11155111","endpoint":"https://ethereum-sepolia-rpc.publicnode.com","failsafe":{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxAttempts":2},"timeout":{"duration":"15s"}},"headers":{"SomeHeader":"Bearer mytoken"},"id":"sep-public-node","ignoreMethods":["alchemy_*"],"jsonRpc":{"batchMaxSize":100,"batchMaxWait":"100ms","supportsBatch":true},"rateLimitAutoTune":{"adjustmentPeriod":"1m","decreaseFactor":0.9,"enabled":true,"errorRateThreshold":0.1,"increaseFactor":1.05,"maxBudget":10000,"minBudget":0},"rateLimitBudget":"freemium"}]` | A upstream is defined to handle 1 or more networks (a.k.a. chains). ref: https://docs.erpc.cloud/config/projects/upstreams |
| erpc.projects[0].upstreams[0].maxAvailableRecentBlocks | int | `128` | DEFAULT: 128 (for "full" nodes). |
| erpc.projects[0].upstreams[0].nodeType | string | `"full"` | DEFAULT: archive |
| erpc.projects[0].upstreams[0].statePollerInterval | OPTIONAL | `"30s"` | statePollerInterval used to periodically fetch the latest/finalized/sync states. To disable state polling set this value to 0, which means no regular calls to RPC for latest/finalized/sync states. The consequence of this is all data will be considered "unfinalized" or "unknown" despite their block numbers (and where if theye're actually finalized or not). DEFAULT: 30s. |
| erpc.projects[0].upstreams[1].allowMethods | list | `["eth_getLogs"]` | Explicitly allowed methods will take precedence over ignoreMethods. For example if you only want eth_getLogs to be served, set ignore methods to "*" and allowMethods to "eth_getLogs". |
| erpc.projects[0].upstreams[1].failsafe | object | `{"retry":{"backoffFactor":0.3,"backoffMaxDelay":"10s","delay":"1000ms","jitter":"500ms","maxAttempts":2},"timeout":{"duration":"15s"}}` | [optional] - additional failsafe settings for this upstream |
| erpc.rateLimiters | list | `[{"id":"freemium","rules":[{"maxCount":100,"method":"*","period":"1s"}]},{"id":"premium","rules":[{"maxCount":1000,"method":"*","period":"2s"}]}]` | Define rate limiters for upstreams. ref: https://docs.erpc.cloud/config/projects/rate-limiters |
| erpc.server | object | `{"enableGzip":true,"httpHostV4":"0.0.0.0","httpHostV6":"[::]","httpPort":4000,"listenV4":true,"listenV6":false,"maxTimeout":"30s","readTimeout":"10s","tls":{"caFile":"/path/to/ca.pem","certFile":"/path/to/cert.pem","enabled":false,"insecureSkipVerify":false,"keyFile":"/path/to/key.pem"},"writeTimeout":"20s"}` | eRPC configuration, ref: https://docs.erpc.cloud/config/example#full-config-example |
| erpc.sharedState | object | `{}` | Shared state configuration, ref: https://docs.erpc.cloud/config/database/shared-state |
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
| tolerations | list | `[]` |  |
| updateStrategy | string | `nil` | default RollingUpdate |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
