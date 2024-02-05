# mantle

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.4.3](https://img.shields.io/badge/AppVersion-v0.4.3-informational?style=flat-square)

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
| env[0].value | string | `"9f50ccaebd966113a0ef09793f8a3288cd0bb2c05d20caa3c0015b4e665f1b2d"` |  |
| env[10].name | string | `"NO_USB"` |  |
| env[10].value | string | `"true"` |  |
| env[11].name | string | `"NO_DISCOVER"` |  |
| env[11].value | string | `"true"` |  |
| env[12].name | string | `"ROLLUP_TIMESTAMP_REFRESH"` |  |
| env[12].value | string | `"5s"` |  |
| env[13].name | string | `"ROLLUP_STATE_DUMP_PATH"` |  |
| env[13].value | string | `"https://mantlenetworkio.github.io/networks/mainnet/genesis.json"` |  |
| env[14].name | string | `"ROLLUP_CLIENT_HTTP"` |  |
| env[14].value | string | `"https://dtl-eu.mantle.xyz/"` |  |
| env[15].name | string | `"ROLLUP_ENFORCE_FEES"` |  |
| env[15].value | string | `"true"` |  |
| env[16].name | string | `"ROLLUP_FEE_THRESHOLD_DOWN"` |  |
| env[16].value | string | `"1"` |  |
| env[17].name | string | `"ROLLUP_FEE_THRESHOLD_UP"` |  |
| env[17].value | string | `"4000"` |  |
| env[18].name | string | `"RETRIES"` |  |
| env[18].value | string | `"60"` |  |
| env[19].name | string | `"ROLLUP_POLL_INTERVAL_FLAG"` |  |
| env[19].value | string | `"500ms"` |  |
| env[1].name | string | `"BLOCK_SIGNER_ADDRESS"` |  |
| env[1].value | string | `"0x000000b36A00872bAF079426e012Cf5Cd2A74E8b"` |  |
| env[20].name | string | `"ROLLUP_ENABLE_L2_GAS_POLLING"` |  |
| env[20].value | string | `"true"` |  |
| env[21].name | string | `"ROLLUP_BACKEND"` |  |
| env[21].value | string | `"l2"` |  |
| env[22].name | string | `"ROLLUP_VERIFIER_ENABLE"` |  |
| env[22].value | string | `"true"` |  |
| env[23].name | string | `"RPC_ENABLE"` |  |
| env[23].value | string | `"true"` |  |
| env[24].name | string | `"RPC_ADDR"` |  |
| env[24].value | string | `"0.0.0.0"` |  |
| env[25].name | string | `"RPC_PORT"` |  |
| env[25].value | string | `"8545"` |  |
| env[26].name | string | `"RPC_API"` |  |
| env[26].value | string | `"eth,net,rollup,web3"` |  |
| env[27].name | string | `"RPC_CORS_DOMAIN"` |  |
| env[27].value | string | `"*"` |  |
| env[28].name | string | `"RPC_VHOSTS"` |  |
| env[28].value | string | `"*"` |  |
| env[29].name | string | `"SEQUENCER_CLIENT_HTTP"` |  |
| env[29].value | string | `"https://rpc.mantle.xyz"` |  |
| env[2].name | string | `"CHAIN_ID"` |  |
| env[2].value | string | `"5000"` |  |
| env[30].name | string | `"TARGET_GAS_LIMIT"` |  |
| env[30].value | string | `"30000000"` |  |
| env[31].name | string | `"WS"` |  |
| env[31].value | string | `"true"` |  |
| env[32].name | string | `"WS_ADDR"` |  |
| env[32].value | string | `"0.0.0.0"` |  |
| env[33].name | string | `"WS_PORT"` |  |
| env[33].value | string | `"8546"` |  |
| env[34].name | string | `"WS_API"` |  |
| env[34].value | string | `"eth,net,rollup,web3"` |  |
| env[35].name | string | `"WS_ORIGINS"` |  |
| env[35].value | string | `"*"` |  |
| env[36].name | string | `"USING_BVM"` |  |
| env[36].value | string | `"true"` |  |
| env[37].name | string | `"VERBOSITY"` |  |
| env[37].value | string | `"3"` |  |
| env[3].name | string | `"ETH1_SYNC_SERVICE_ENABLE"` |  |
| env[3].value | string | `"true"` |  |
| env[4].name | string | `"ETH1_CONFIRMATION_DEPTH"` |  |
| env[4].value | string | `"0"` |  |
| env[5].name | string | `"ETH1_CTC_DEPLOYMENT_HEIGHT"` |  |
| env[5].value | string | `"17577586"` |  |
| env[6].name | string | `"GASPRICE"` |  |
| env[6].value | string | `"0"` |  |
| env[7].name | string | `"GCMODE"` |  |
| env[7].value | string | `"archive"` |  |
| env[8].name | string | `"IPC_DISABLE"` |  |
| env[8].value | string | `"true"` |  |
| env[9].name | string | `"NETWORK_ID"` |  |
| env[9].value | string | `"5000"` |  |
| ethL1 | string | `"https://rpc.ankr.com/eth"` | ETH l1 node |
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
| snapShotSync | object | `{"enabled":false,"snapShotUrl":"https://s3.ap-southeast-1.amazonaws.com/snapshot.mantle.xyz","tarballName":"20240117-mainnet-chaindata.tar"}` | Download from snapshot. will run snapshot sync before starting node in an initContainer. |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
