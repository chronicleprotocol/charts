# arbitrum

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v3.2.1-d81324d](https://img.shields.io/badge/AppVersion-v3.2.1--d81324d-informational?style=flat-square)

A Helm chart for deploying Arbitrum Nitro on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| data.path | string | `"/home/user/.arbitrum"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"offchainlabs/nitro-node"` |  |
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
| nitro.extraArgs | object | `{}` |  |
| nitro.httpAddr | object | `{}` |  |
| nitro.httpApi[0] | string | `"net"` |  |
| nitro.httpApi[1] | string | `"web3"` |  |
| nitro.httpApi[2] | string | `"eth"` |  |
| nitro.httpApi[3] | string | `"debug"` |  |
| nitro.httpCorsDomain | object | `{}` |  |
| nitro.httpVhosts | object | `{}` |  |
| nitro.l1BeaconUrl | string | `"https://ethereum-sepolia-beacon-api.publicnode.com"` |  |
| nitro.l1RpcUrl | string | `"https://ethereum-sepolia-rpc.publicnode.com"` |  |
| nitro.l2ChainId | int | `421614` | can also be Orbit Chain ID for non arbitrum chains |
| nitro.l2ChainInfo | object | `{}` |  |
| nitro.l2ChainName | object | `{}` |  |
| nitro.l2ExecutionCaching | bool | `false` |  |
| nitro.l2ExecutionForwardingTarget | object | `{}` |  |
| nitro.l2FeedInputUrl | object | `{}` |  |
| nitro.l2NodeDataAvailability.enabled | bool | `false` |  |
| nitro.l2NodeDataAvailability.restAggregator | bool | `true` |  |
| nitro.l2NodeDataAvailability.urls | object | `{}` |  |
| nitro.l2Staker | bool | `false` |  |
| nitro.metrics.enabled | bool | `true` |  |
| nitro.metrics.serverAddr | object | `{}` |  |
| nitro.metrics.serverPort | object | `{}` |  |
| nitro.metrics.serverUpdateInterval | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"3Ti"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.enabled | bool | `false` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.ports.metrics.port | int | `6070` |  |
| service.ports.metrics.protocol | string | `"TCP"` |  |
| service.ports.rpc.port | int | `8547` |  |
| service.ports.rpc.protocol | string | `"TCP"` |  |
| service.ports.sequencer.port | int | `9642` |  |
| service.ports.sequencer.protocol | string | `"TCP"` |  |
| service.ports.ws.port | int | `8548` |  |
| service.ports.ws.protocol | string | `"TCP"` |  |
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
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
