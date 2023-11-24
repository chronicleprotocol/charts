# mantle

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.4.3](https://img.shields.io/badge/AppVersion-v0.4.3-informational?style=flat-square)

A Helm chart for deploying Mantle RPC nodes on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| data | object | `{"path":"/mantle-data"}` | Path to store data |
| env[0].name | string | `"BLOCK_SIGNER_KEY"` |  |
| env[0].value | string | `"22c7fa2d2cf5c0ccc21ff32a210d7dfea7bbc7d16c3ba0a75302a7b51c16c4f7"` |  |
| env[10].name | string | `"NETWORK_ID"` |  |
| env[10].value | int | `5000` |  |
| env[11].name | string | `"NO_USB"` |  |
| env[11].value | bool | `true` |  |
| env[12].name | string | `"NO_DISCOVER"` |  |
| env[12].value | bool | `true` |  |
| env[13].name | string | `"ROLLUP_TIMESTAMP_REFRESH"` |  |
| env[13].value | string | `"5s"` |  |
| env[14].name | string | `"ROLLUP_STATE_DUMP_PATH"` |  |
| env[14].value | string | `"https://mantlenetworkio.github.io/networks/mainnet/genesis.json"` |  |
| env[15].name | string | `"ROLLUP_CLIENT_HTTP"` |  |
| env[15].value | string | `"https://dtl.mantle.xyz"` |  |
| env[16].name | string | `"ROLLUP_ENFORCE_FEES"` |  |
| env[16].value | bool | `true` |  |
| env[17].name | string | `"ROLLUP_FEE_THRESHOLD_DOWN"` |  |
| env[17].value | int | `1` |  |
| env[18].name | string | `"ROLLUP_FEE_THRESHOLD_UP"` |  |
| env[18].value | int | `4000` |  |
| env[19].name | string | `"RETRIES"` |  |
| env[19].value | int | `60` |  |
| env[1].name | string | `"BLOCK_SIGNER_ADDRESS"` |  |
| env[1].value | string | `"0xa9eC80835800a59Fd022f53e3E75AA4552F22ccB"` |  |
| env[20].name | string | `"ROLLUP_POLL_INTERVAL_FLAG"` |  |
| env[20].value | string | `"500ms"` |  |
| env[21].name | string | `"ROLLUP_ENABLE_L2_GAS_POLLING"` |  |
| env[21].value | bool | `true` |  |
| env[22].name | string | `"ROLLUP_BACKEND"` |  |
| env[22].value | string | `"l2"` |  |
| env[23].name | string | `"ROLLUP_VERIFIER_ENABLE"` |  |
| env[23].value | bool | `true` |  |
| env[24].name | string | `"RPC_ENABLE"` |  |
| env[24].value | bool | `true` |  |
| env[25].name | string | `"RPC_ADDR"` |  |
| env[25].value | string | `"0.0.0.0"` |  |
| env[26].name | string | `"RPC_PORT"` |  |
| env[26].value | int | `8545` |  |
| env[27].name | string | `"RPC_API"` |  |
| env[27].value | string | `"eth,net,rollup,web3"` |  |
| env[28].name | string | `"RPC_CORS_DOMAIN"` |  |
| env[28].value | string | `"*"` |  |
| env[29].name | string | `"RPC_VHOSTS"` |  |
| env[29].value | string | `"*"` |  |
| env[2].name | string | `"CHAIN_ID"` |  |
| env[2].value | int | `5000` |  |
| env[30].name | string | `"SEQUENCER_CLIENT_HTTP"` |  |
| env[30].value | string | `"https://rpc.mantle.xyz"` |  |
| env[31].name | string | `"TARGET_GAS_LIMIT"` |  |
| env[31].value | int | `30000000` |  |
| env[32].name | string | `"WS"` |  |
| env[32].value | bool | `true` |  |
| env[33].name | string | `"WS_ADDR"` |  |
| env[33].value | string | `"0.0.0.0"` |  |
| env[34].name | string | `"WS_PORT"` |  |
| env[34].value | int | `8546` |  |
| env[35].name | string | `"WS_API"` |  |
| env[35].value | string | `"eth,net,rollup,web3"` |  |
| env[36].name | string | `"WS_ORIGINS"` |  |
| env[36].value | string | `"*"` |  |
| env[37].name | string | `"USING_BVM"` |  |
| env[37].value | bool | `true` |  |
| env[38].name | string | `"VERBOSITY"` |  |
| env[38].value | int | `3` |  |
| env[3].name | string | `"ETH1_HTTP"` |  |
| env[3].value | string | `"https://rpc.ankr.com/eth"` |  |
| env[4].name | string | `"ETH1_SYNC_SERVICE_ENABLE"` |  |
| env[4].value | bool | `true` |  |
| env[5].name | string | `"ETH1_CONFIRMATION_DEPTH"` |  |
| env[5].value | string | `"0"` |  |
| env[6].name | string | `"ETH1_CTC_DEPLOYMENT_HEIGHT"` |  |
| env[6].value | string | `"17577586"` |  |
| env[7].name | string | `"GASPRICE"` |  |
| env[7].value | string | `"0"` |  |
| env[8].name | string | `"GCMODE"` |  |
| env[8].value | string | `"archive"` |  |
| env[9].name | string | `"IPC_DISABLE"` |  |
| env[9].value | bool | `true` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"mantlenetworkio/l2geth"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `120` |  |
| livenessProbe.tcpSocket.port | string | `"httprpc"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"20Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.tcpSocket.port | string | `"httprpc"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.ports.httprpc.port | int | `8545` |  |
| service.ports.httprpc.protocol | string | `"TCP"` |  |
| service.ports.wsrpc.port | int | `8546` |  |
| service.ports.wsrpc.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"1m"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/debug/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| snapShotSync | object | `{"enabled":false,"snapShotUrl":"https://s3.ap-southeast-1.amazonaws.com/snapshot.mantle.xyz","tarballName":"20231119-mainnet-chaindata.tar"}` | Download from snapshot. will run snapshot sync before starting node in an initContainer. |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
