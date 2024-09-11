# base

![Version: 0.0.6](https://img.shields.io/badge/Version-0.0.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.10.2](https://img.shields.io/badge/AppVersion-v0.10.2-informational?style=flat-square)

A Helm chart for deploying Base RPC nodes on Kubernetes

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
| extraObjects | list | `[]` | Extra K8s manifests to deploy |
| fullnameOverride | string | `""` |  |
| geth.bootNodes | string | `"enode://87a32fd13bd596b2ffca97020e31aef4ddcc1bbd4b95bb633d16c1329f654f34049ed240a36b449fda5e5225d70fe40bc667f53c304b71f8e68fc9d448690b51@3.231.138.188:30301,enode://ca21ea8f176adb2e229ce2d700830c844af0ea941a1d8152a9513b966fe525e809c3a6c73a2c18a12b74ed6ec4380edf91662778fe0b79f6a591236e49e176f9@184.72.129.189:30301,enode://acf4507a211ba7c1e52cdf4eef62cdc3c32e7c9c47998954f7ba024026f9a6b2150cd3f0b734d9c78e507ab70d59ba61dfe5c45e1078c7ad0775fb251d7735a2@3.220.145.177:30301,enode://8a5a5006159bf079d06a04e5eceab2a1ce6e0f721875b2a9c96905336219dbe14203d38f70f3754686a6324f786c2f9852d8c0dd3adac2d080f4db35efc678c5@3.231.11.52:30301,enode://cdadbe835308ad3557f9a1de8db411da1a260a98f8421d62da90e71da66e55e98aaa8e90aa7ce01b408a54e4bd2253d701218081ded3dbe5efbbc7b41d7cef79@54.198.153.150:30301"` | List of boot nodes for geth. Defaults to mainnet value. |
| geth.genesisFilePath | string | `"mainnet/genesis-l2.json"` | Genesis file path. Defaults to mainnet value. |
| geth.livenessProbe.initialDelaySeconds | int | `60` |  |
| geth.livenessProbe.periodSeconds | int | `120` |  |
| geth.livenessProbe.tcpSocket.port | string | `"rpc"` |  |
| geth.readinessProbe.initialDelaySeconds | int | `10` |  |
| geth.readinessProbe.periodSeconds | int | `10` |  |
| geth.readinessProbe.tcpSocket.port | string | `"rpc"` |  |
| geth.resources | object | `{}` |  |
| geth.securityContext | object | `{}` |  |
| geth.sequencerHttp | string | `"https://mainnet-sequencer.base.org"` | URL of the sequencer. Defaults to mainnet value. |
| geth.service.ports.metrics.port | int | `7060` |  |
| geth.service.ports.metrics.protocol | string | `"TCP"` |  |
| geth.service.ports.rpc.port | int | `8545` |  |
| geth.service.ports.rpc.protocol | string | `"TCP"` |  |
| geth.service.ports.ws.port | int | `8546` |  |
| geth.service.ports.ws.protocol | string | `"TCP"` |  |
| geth.service.type | string | `"ClusterIP"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/base-org/node"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| jwtSecret.default | string | `"688f5d737bad920bdfb2fc2f488d6b6209eebda1dae949a8de91398d932c517a"` |  |
| jwtSecret.fromSecret | bool | `false` | Whether it loads the jwt secret from a Kubernetes secret |
| nameOverride | string | `""` |  |
| networkId | string | `"base-mainnet"` | Network id. Defaults to mainnet value. |
| nodeSelector | object | `{}` |  |
| opNode.l1Beacon | string | `"https://ethereum-beacon-api.publicnode.com"` | L1 Beacon URL. Defaults to mainnet value. |
| opNode.l1EthRpc | string | `"https://ethereum-rpc.publicnode.com"` | L1 RPC URL. Defaults to mainnet value. |
| opNode.l1TrustRpc | string | `"true"` | Boolean wheter to trust L1 RPC. Defaults to true. |
| opNode.livenessProbe.initialDelaySeconds | int | `60` |  |
| opNode.livenessProbe.periodSeconds | int | `120` |  |
| opNode.livenessProbe.tcpSocket.port | string | `"rpc"` |  |
| opNode.p2pBootNodes | string | `"enr:-J24QNz9lbrKbN4iSmmjtnr7SjUMk4zB7f1krHZcTZx-JRKZd0kA2gjufUROD6T3sOWDVDnFJRvqBBo62zuF-hYCohOGAYiOoEyEgmlkgnY0gmlwhAPniryHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQKNVFlCxh_B-716tTs-h1vMzZkSs1FTu_OYTNjgufplG4N0Y3CCJAaDdWRwgiQG,enr:-J24QH-f1wt99sfpHy4c0QJM-NfmsIfmlLAMMcgZCUEgKG_BBYFc6FwYgaMJMQN5dsRBJApIok0jFn-9CS842lGpLmqGAYiOoDRAgmlkgnY0gmlwhLhIgb2Hb3BzdGFja4OFQgCJc2VjcDI1NmsxoQJ9FTIv8B9myn1MWaC_2lJ-sMoeCDkusCsk4BYHjjCq04N0Y3CCJAaDdWRwgiQG,enr:-J24QDXyyxvQYsd0yfsN0cRr1lZ1N11zGTplMNlW4xNEc7LkPXh0NAJ9iSOVdRO95GPYAIc6xmyoCCG6_0JxdL3a0zaGAYiOoAjFgmlkgnY0gmlwhAPckbGHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQJwoS7tzwxqXSyFL7g0JM-KWVbgvjfB8JA__T7yY_cYboN0Y3CCJAaDdWRwgiQG,enr:-J24QHmGyBwUZXIcsGYMaUqGGSl4CFdx9Tozu-vQCn5bHIQbR7On7dZbU61vYvfrJr30t0iahSqhc64J46MnUO2JvQaGAYiOoCKKgmlkgnY0gmlwhAPnCzSHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQINc4fSijfbNIiGhcgvwjsjxVFJHUstK9L1T8OTKUjgloN0Y3CCJAaDdWRwgiQG,enr:-J24QG3ypT4xSu0gjb5PABCmVxZqBjVw9ca7pvsI8jl4KATYAnxBmfkaIuEqy9sKvDHKuNCsy57WwK9wTt2aQgcaDDyGAYiOoGAXgmlkgnY0gmlwhDbGmZaHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQIeAK_--tcLEiu7HvoUlbV52MspE0uCocsx1f_rYvRenIN0Y3CCJAaDdWRwgiQG"` | List of OP Node P2P boot nodes. Defaults to mainnet value. |
| opNode.readinessProbe.initialDelaySeconds | int | `10` |  |
| opNode.readinessProbe.periodSeconds | int | `10` |  |
| opNode.readinessProbe.tcpSocket.port | string | `"rpc"` |  |
| opNode.resources | object | `{}` |  |
| opNode.rollupConfig | string | `"mainnet/rollup.json"` | Path to rollup config. Defaults to mainnet value. |
| opNode.securityContext | object | `{}` |  |
| opNode.service.ports.metrics.port | int | `7300` |  |
| opNode.service.ports.metrics.protocol | string | `"TCP"` |  |
| opNode.service.ports.pprof.port | int | `6060` |  |
| opNode.service.ports.pprof.protocol | string | `"TCP"` |  |
| opNode.service.ports.rpc.port | int | `9545` |  |
| opNode.service.ports.rpc.protocol | string | `"TCP"` |  |
| opNode.service.type | string | `"ClusterIP"` |  |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"1600Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | Number of replicas for workload. |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"1m"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/debug/metrics/prometheus"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| snapShotSync.enabled | bool | `false` | Whether to restore from snapshot. will run snapshot sync before starting node in an initContainer. refer to https://docs.base.org/guides/run-a-base-node/#snapshots |
| snapShotSync.snapShotUrl | string | `"https://base-snapshots-mainnet-archive.s3.amazonaws.com/$(curl https://base-snapshots-mainnet-archive.s3.amazonaws.com/latest)"` | The URL of snapshot to download. |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
