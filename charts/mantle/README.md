# mantle

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.4.3](https://img.shields.io/badge/AppVersion-v0.4.3-informational?style=flat-square)

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
| blockSignerAddress | string | `"0x000000b36A00872bAF079426e012Cf5Cd2A74E8b"` |  |
| blockSignerKey | string | `"9f50ccaebd966113a0ef09793f8a3288cd0bb2c05d20caa3c0015b4e665f1b2d"` |  |
| chainId | int | `5000` | Chain Id |
| data | object | `{"path":"/root/.ethereum/geth"}` | Path to store data |
| env[0].name | string | `"ETH1_SYNC_SERVICE_ENABLE"` |  |
| env[0].value | string | `"true"` |  |
| env[10].name | string | `"ROLLUP_FEE_THRESHOLD_DOWN"` |  |
| env[10].value | string | `"1"` |  |
| env[11].name | string | `"ROLLUP_TIMESTAMP_REFRESH"` |  |
| env[11].value | string | `"5s"` |  |
| env[12].name | string | `"ETH1_CTC_DEPLOYMENT_HEIGHT"` |  |
| env[12].value | string | `"8"` |  |
| env[13].name | string | `"RETRIES"` |  |
| env[13].value | string | `"60"` |  |
| env[14].name | string | `"NO_DISCOVER"` |  |
| env[14].value | string | `"true"` |  |
| env[15].name | string | `"NO_USB"` |  |
| env[15].value | string | `"true"` |  |
| env[16].name | string | `"GCMODE"` |  |
| env[16].value | string | `"archive"` |  |
| env[17].name | string | `"RPC_VHOSTS"` |  |
| env[17].value | string | `"*"` |  |
| env[18].name | string | `"ETH1_CONFIRMATION_DEPTH"` |  |
| env[18].value | string | `"0"` |  |
| env[19].name | string | `"USING_BVM"` |  |
| env[19].value | string | `"true"` |  |
| env[1].name | string | `"GASPRICE"` |  |
| env[1].value | string | `"0"` |  |
| env[20].name | string | `"ROLLUP_POLL_INTERVAL_FLAG"` |  |
| env[20].value | string | `"500ms"` |  |
| env[21].name | string | `"VERBOSITY"` |  |
| env[21].value | string | `"3"` |  |
| env[22].name | string | `"WS_PORT"` |  |
| env[22].value | string | `"8546"` |  |
| env[23].name | string | `"WS_ADDR"` |  |
| env[23].value | string | `"0.0.0.0"` |  |
| env[24].name | string | `"WS"` |  |
| env[24].value | string | `"true"` |  |
| env[25].name | string | `"WS_ORIGINS"` |  |
| env[25].value | string | `"*"` |  |
| env[26].name | string | `"RPC_ADDR"` |  |
| env[26].value | string | `"0.0.0.0"` |  |
| env[27].name | string | `"ROLLUP_VERIFIER_ENABLE"` |  |
| env[27].value | string | `"true"` |  |
| env[28].name | string | `"ROLLUP_FEE_THRESHOLD_UP"` |  |
| env[28].value | string | `"4000"` |  |
| env[29].name | string | `"WS_API"` |  |
| env[29].value | string | `"eth,net,rollup,web3"` |  |
| env[2].name | string | `"RPC_ENABLE"` |  |
| env[2].value | string | `"true"` |  |
| env[3].name | string | `"IPC_DISABLE"` |  |
| env[3].value | string | `"true"` |  |
| env[4].name | string | `"ROLLUP_BACKEND"` |  |
| env[4].value | string | `"l2"` |  |
| env[5].name | string | `"ROLLUP_ENABLE_L2_GAS_POLLING"` |  |
| env[5].value | string | `"true"` |  |
| env[6].name | string | `"ROLLUP_ENFORCE_FEES"` |  |
| env[6].value | string | `"true"` |  |
| env[7].name | string | `"RPC_API"` |  |
| env[7].value | string | `"eth,net,rollup,web3"` |  |
| env[8].name | string | `"RPC_CORS_DOMAIN"` |  |
| env[8].value | string | `"*"` |  |
| env[9].name | string | `"TARGET_GAS_LIMIT"` |  |
| env[9].value | string | `"30000000"` |  |
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
| networkId | int | `5000` | Network id |
| nodeSelector | object | `{}` |  |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"1600Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.tcpSocket.port | string | `"httprpc"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| rollUpClientHttp | string | `"https://dtl.mantle.xyz"` | DLT service url refer to https://docs.mantle.xyz/network/for-validators/deploy-a-node/deploying-a-rollup-verifier-replica-node#network-dtl-url |
| rollUpStateDumpPath | string | `"https://mantlenetworkio.github.io/networks/mainnet/genesis.json"` |  |
| securityContext | object | `{}` |  |
| sequencerClientHttp | string | `"https://rpc.mantle.xyz"` |  |
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
| snapShotSync | object | `{"enabled":false,"snapShotUrl":"https://s3.ap-southeast-1.amazonaws.com/snapshot.mantle.xyz","tarballName":"20240117-mainnet-chaindata.tar"}` | Download from snapshot. will run snapshot sync before starting node in an initContainer. refer to https://github.com/mantlenetworkio/networks/blob/main/run-node-mainnet.md#download-latest-snapshot-from-mantle |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
