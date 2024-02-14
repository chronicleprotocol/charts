# rpc-router

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.49.0](https://img.shields.io/badge/AppVersion-0.49.0-informational?style=flat-square)

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
| dshackle.accessLog | bool | `false` |  |
| dshackle.compression.grpc.client.enabled | bool | `false` |  |
| dshackle.compression.grpc.server.enabled | bool | `false` |  |
| dshackle.health.host | string | `"0.0.0.0"` |  |
| dshackle.metrics.bind | string | `"0.0.0.0"` |  |
| dshackle.metrics.enabled | bool | `true` |  |
| dshackle.metrics.extended | bool | `false` |  |
| dshackle.metrics.jvm | bool | `false` |  |
| dshackle.metrics.path | string | `"/metrics"` |  |
| dshackle.routes[0].blockchain | string | `"arbitrum"` |  |
| dshackle.routes[0].id | string | `"arb1"` |  |
| dshackle.routes[10].blockchain | string | `"optimism-testnet"` |  |
| dshackle.routes[10].id | string | `"ogor"` |  |
| dshackle.routes[11].blockchain | string | `"polygon-zkevm"` |  |
| dshackle.routes[11].id | string | `"zkevm"` |  |
| dshackle.routes[12].blockchain | string | `"polygon-zkevm-testnet"` |  |
| dshackle.routes[12].id | string | `"zkevmtest"` |  |
| dshackle.routes[13].blockchain | string | `"zksync"` |  |
| dshackle.routes[13].id | string | `"zksync"` |  |
| dshackle.routes[14].blockchain | string | `"zksync-sepolia"` |  |
| dshackle.routes[14].id | string | `"zksyncsep"` |  |
| dshackle.routes[1].blockchain | string | `"arbitrum-testnet"` |  |
| dshackle.routes[1].id | string | `"arb"` |  |
| dshackle.routes[2].blockchain | string | `"ethereum"` |  |
| dshackle.routes[2].id | string | `"eth"` |  |
| dshackle.routes[3].blockchain | string | `"goerli"` |  |
| dshackle.routes[3].id | string | `"gor"` |  |
| dshackle.routes[4].blockchain | string | `"gnosis"` |  |
| dshackle.routes[4].id | string | `"gno"` |  |
| dshackle.routes[5].blockchain | string | `"gnosis-chiado"` |  |
| dshackle.routes[5].id | string | `"chi"` |  |
| dshackle.routes[6].blockchain | string | `"sepolia"` |  |
| dshackle.routes[6].id | string | `"sep"` |  |
| dshackle.routes[7].blockchain | string | `"mantle"` |  |
| dshackle.routes[7].id | string | `"mantle"` |  |
| dshackle.routes[8].blockchain | string | `"mantle-testnet"` |  |
| dshackle.routes[8].id | string | `"mantletest"` |  |
| dshackle.routes[9].blockchain | string | `"optimism"` |  |
| dshackle.routes[9].id | string | `"oeth"` |  |
| dshackle.signedResponse | bool | `false` |  |
| dshackle.upstreams | string | `"- id: arb-mainnet\n  chain: arbitrum\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://arbitrum-one.public.blastapi.io\"\n- id: arb-goerli\n  chain: arbitrum-testnet\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://arbitrum-goerli.public.blastapi.io\"\n- id: eth-mainnet\n  chain: ethereum\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://eth.public-rpc.com\"\n- id: eth-goerli\n  chain: goerli\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://ethereum-goerli.publicnode.com\"\n- id: eth-sepolia\n  chain: sepolia\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://eth-sepolia.public.blastapi.io\"\n- id: gnosis-mainnet\n  chain: gnosis\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://gnosis-mainnet.public.blastapi.io\"\n- id: gnosis-chiado\n  chain: gnosis-chiado\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://gnosis-chiado.public.blastapi.io\"\n- id: mantle\n  chain: mantle\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://mantle-mainnet.public.blastapi.io\"\n- id: mantle-gor\n  chain: mantle-testnet\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://mantle-goerli.public.blastapi.io\"\n- id: opt-mainent\n  chain: optimism\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://optimism-mainnet.public.blastapi.io\"\n- id: opt-goerli\n  chain: optimism-testnet\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://optimism-goerli.public.blastapi.io\"\n- id: zkevm\n  chain: polygon-zkevm\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://polygon-zkevm-mainnet.public.blastapi.io\"\n- id: zkevm\n  chain: polygon-zkevm-testnet\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://polygon-zkevm-testnet.public.blastapi.io\"\n- id: zksync\n  chain: zksync\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://zksync-mainnet.public.blastapi.io\"\n- id: zkevm\n  chain: zksync-sepolia\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://zksync-sepolia.public.blastapi.io\"\n"` |  |
| fullnameOverride | string | `""` |  |
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
| redis.replica.replicaCount | int | `3` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.ports.grpc.port | int | `12448` |  |
| service.ports.grpc.protocol | string | `"TCP"` |  |
| service.ports.health.port | int | `8082` |  |
| service.ports.health.protocol | string | `"TCP"` |  |
| service.ports.metrics.port | int | `8080` |  |
| service.ports.metrics.protocol | string | `"TCP"` |  |
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
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
