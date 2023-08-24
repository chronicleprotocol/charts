# rpc-router

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.37.0](https://img.shields.io/badge/AppVersion-0.37.0-informational?style=flat-square)

A Helm chart for deploying Emerald Dshackle - Fault Tolerant Load Balancer for Blockchain API, to Kubernetes,

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
| dshackle.routes[0].blockchain | string | `"ethereum"` |  |
| dshackle.routes[0].id | string | `"eth"` |  |
| dshackle.routes[10].blockchain | string | `"polygon-zkevm-testnet"` |  |
| dshackle.routes[10].id | string | `"zkevmtest"` |  |
| dshackle.routes[1].blockchain | string | `"goerli"` |  |
| dshackle.routes[1].id | string | `"geth"` |  |
| dshackle.routes[2].blockchain | string | `"sepolia"` |  |
| dshackle.routes[2].id | string | `"sep"` |  |
| dshackle.routes[3].blockchain | string | `"arbitrum"` |  |
| dshackle.routes[3].id | string | `"arb1"` |  |
| dshackle.routes[4].blockchain | string | `"arbitrum-testnet"` |  |
| dshackle.routes[4].id | string | `"arb-goerli"` |  |
| dshackle.routes[5].blockchain | string | `"optimism"` |  |
| dshackle.routes[5].id | string | `"oeth"` |  |
| dshackle.routes[6].blockchain | string | `"optimism-testnet"` |  |
| dshackle.routes[6].id | string | `"ogor"` |  |
| dshackle.routes[7].blockchain | string | `"polygon"` |  |
| dshackle.routes[7].id | string | `"matic"` |  |
| dshackle.routes[8].blockchain | string | `"polygon-mumbai"` |  |
| dshackle.routes[8].id | string | `"maticmum"` |  |
| dshackle.routes[9].blockchain | string | `"polygon-zkevm"` |  |
| dshackle.routes[9].id | string | `"zkevm"` |  |
| dshackle.upstreams | string | `"- id: blastapi-mainnet\n  chain: ethereum\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://eth-mainnet.blastapi.io/\"\n- id: alchemy-mainnet\n  chain: ethereum\n  options:\n    disable-validation: false\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://eth-mainnet.g.alchemy.com/v2/\"\n\n- id: blastapi-goerli\n  chain: goerli\n  options:\n    disable-validation: true\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://eth-goerli.blastapi.io/\"\n- id: alchemy-goerli-dev\n  chain: goerli\n  options:\n    disable-validation: false\n  methods:\n    enabled:\n      - name: eth_maxPriorityFeePerGas\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://eth-goerli.g.alchemy.com/v2/\"\n- id: alchemy-goerli\n  chain: goerli\n  options:\n    disable-validation: false\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://eth-goerli.g.alchemy.com/v2/\"\n- id: blastapi-arb\n  chain: arbitrum\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://arbitrum-one.blastapi.io/\"\n- id: alchemy-arb\n  chain: arbitrum\n  options:\n    disable-validation: false\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://arb-mainnet.g.alchemy.com/v2/\"\n- id: blastapi-arb-goerli\n  chain: arbitrum-testnet\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://arbitrum-goerli.blastapi.io/\"\n- id: alchemy-arb-goerli\n  chain: arbitrum-testnet\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://arb-goerli.g.alchemy.com/v2/\"\n- id: blastapi-opt\n  chain: optimism\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://optimism-mainnet.blastapi.io/\"\n- id: alchemy-opt\n  chain: optimism\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://opt-mainnet.g.alchemy.com/v2/\"\n- id: blast-opt-goerli\n  chain: optimism-testnet\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://optimism-goerli.blastapi.io/\"\n- id: alchemy-opt-goerli\n  chain: optimism-testnet\n  options:\n    disable-validation: true\n  connection:\n    ethereum-pos:\n      execution:\n        rpc:\n          url: \"https://opt-goerli.g.alchemy.com/v2/\"\n"` |  |
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
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.ports.grpc.port | int | `12448` |  |
| service.ports.grpc.protocol | string | `"TCP"` |  |
| service.ports.proxy.port | int | `8545` |  |
| service.ports.proxy.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
