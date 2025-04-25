# nethermind

![Version: 0.0.13](https://img.shields.io/badge/Version-0.0.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.31.9](https://img.shields.io/badge/AppVersion-1.31.9-informational?style=flat-square)

A Helm chart for deploying ETH Nethermind nodes on Kubernetes

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
| data | object | `{"path":"/nethermind-data"}` | Path to store data |
| fullnameOverride | string | `""` |  |
| healthChecks.enabled | bool | `true` |  |
| healthChecks.ui.enabled | bool | `true` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nethermind/nethermind"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| jsonrpc.enabled | bool | `true` |  |
| jsonrpc.engine.modules[0] | string | `"Net"` |  |
| jsonrpc.engine.modules[1] | string | `"Eth"` |  |
| jsonrpc.engine.modules[2] | string | `"Subscribe"` |  |
| jsonrpc.engine.modules[3] | string | `"Engine"` |  |
| jsonrpc.engine.modules[4] | string | `"Web3"` |  |
| jsonrpc.engine.modules[5] | string | `"Client"` |  |
| jsonrpc.modules[0] | string | `"Eth"` |  |
| jsonrpc.modules[1] | string | `"Subscribe"` |  |
| jsonrpc.modules[2] | string | `"Trace"` |  |
| jsonrpc.modules[3] | string | `"TxPool"` |  |
| jsonrpc.modules[4] | string | `"Web3"` |  |
| jsonrpc.modules[5] | string | `"Personal"` |  |
| jsonrpc.modules[6] | string | `"Proof"` |  |
| jsonrpc.modules[7] | string | `"Net"` |  |
| jsonrpc.modules[8] | string | `"Parity"` |  |
| jsonrpc.modules[9] | string | `"Health"` |  |
| jwt | string | `"ecb22bc24e7d4061f7ed690ccd5846d7d73f5d2b9733267e12f56790398d908a"` | JWT secret used by client as a secret. Change this value. |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `120` |  |
| livenessProbe.tcpSocket.port | string | `"httprpc"` |  |
| logLevel | string | `"INFO"` | Log level for the node |
| metrics.enabled | bool | `true` |  |
| metrics.ethStats | bool | `true` | add node to ethstat |
| nameOverride | string | `""` |  |
| network | string | `"sepolia"` | can be Energy Web,Exosama,Goerli (testnet),Gnosis, Chiado ,Holesky (testnet),Mainnet,Sepolia (testnet),Volta (testnet) |
| nodeSelector | object | `{}` |  |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `""` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"20Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `""` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.tcpSocket.port | string | `"httprpc"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.ports.auth.port | int | `8551` |  |
| service.ports.auth.protocol | string | `"TCP"` |  |
| service.ports.httprpc.port | int | `8545` |  |
| service.ports.httprpc.protocol | string | `"TCP"` |  |
| service.ports.metrics.port | int | `9545` |  |
| service.ports.metrics.protocol | string | `"TCP"` |  |
| service.ports.p2ptcp.port | int | `30303` |  |
| service.ports.p2ptcp.protocol | string | `"TCP"` |  |
| service.ports.p2pudp.port | int | `30303` |  |
| service.ports.p2pudp.protocol | string | `"UDP"` |  |
| service.ports.ws.port | int | `8546` |  |
| service.ports.ws.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"1m"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `""` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/debug/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| syncMode | string | `"SnapSync"` | syncMode can be FastSync, SnapSync |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
