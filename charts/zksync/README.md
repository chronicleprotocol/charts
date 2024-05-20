# zksync

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v24.0.0](https://img.shields.io/badge/AppVersion-v24.0.0-informational?style=flat-square)

A Helm chart for deploying zkSync RPC nodes on Kubernetes

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
| database | object | `{"poolSize":"50","url":{"default":"postgres://zksync:zksync@localhost/mainnet2","fromSecret":false}}` | ---------------------------------------------------------------------- Config of the Postgres DB. |
| ethClientUrl | string | `"https://rpc.ankr.com/eth"` |  |
| fullnameOverride | string | `""` |  |
| healthcheckPort | int | `3081` |  |
| httpPort | int | `3060` | ---------------------------------------------------------------------- Port on which to serve the HTTP JSONRPC API. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"matterlabs/external-node"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| l1ChainId | string | `"1"` |  |
| l2ChainId | string | `"324"` |  |
| livenessProbe.httpGet.path | string | `"/health"` |  |
| livenessProbe.httpGet.port | string | `"healthcheck"` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `120` |  |
| logFormat | string | `"json"` |  |
| mainNodeUrl | string | `"https://zksync2-mainnet.zksync.io"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| persistence.annotations | object | `{}` | Annotations for volume claim template |
| persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| persistence.selector | object | `{}` | Selector for volume claim template |
| persistence.size | string | `"1024Gi"` | Requested size for volume claim template |
| persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgres.args[0] | string | `"-c"` |  |
| postgres.args[10] | string | `"-c"` |  |
| postgres.args[11] | string | `"checkpoint_completion_target=0.9"` |  |
| postgres.args[12] | string | `"-c"` |  |
| postgres.args[13] | string | `"wal_buffers=16MB"` |  |
| postgres.args[14] | string | `"-c"` |  |
| postgres.args[15] | string | `"default_statistics_target=500"` |  |
| postgres.args[16] | string | `"-c"` |  |
| postgres.args[17] | string | `"random_page_cost=1.1"` |  |
| postgres.args[18] | string | `"-c"` |  |
| postgres.args[19] | string | `"effective_io_concurrency=200"` |  |
| postgres.args[1] | string | `"log_error_verbosity=terse"` |  |
| postgres.args[20] | string | `"-c"` |  |
| postgres.args[21] | string | `"work_mem=2573kB"` |  |
| postgres.args[22] | string | `"-c"` |  |
| postgres.args[23] | string | `"huge_pages=try"` |  |
| postgres.args[24] | string | `"-c"` |  |
| postgres.args[25] | string | `"min_wal_size=4GB"` |  |
| postgres.args[26] | string | `"-c"` |  |
| postgres.args[27] | string | `"max_wal_size=16GB"` |  |
| postgres.args[28] | string | `"-c"` |  |
| postgres.args[29] | string | `"max_worker_processes=74"` |  |
| postgres.args[2] | string | `"-c"` |  |
| postgres.args[30] | string | `"-c"` |  |
| postgres.args[31] | string | `"max_parallel_workers_per_gather=37"` |  |
| postgres.args[32] | string | `"-c"` |  |
| postgres.args[33] | string | `"max_parallel_workers=74"` |  |
| postgres.args[34] | string | `"-c"` |  |
| postgres.args[35] | string | `"max_parallel_maintenance_workers=4"` |  |
| postgres.args[36] | string | `"-c"` |  |
| postgres.args[37] | string | `"checkpoint_timeout=1800"` |  |
| postgres.args[3] | string | `"max_connections=256"` |  |
| postgres.args[4] | string | `"-c"` |  |
| postgres.args[5] | string | `"shared_buffers=47616MB"` |  |
| postgres.args[6] | string | `"-c"` |  |
| postgres.args[7] | string | `"effective_cache_size=142848MB"` |  |
| postgres.args[8] | string | `"-c"` |  |
| postgres.args[9] | string | `"maintenance_work_mem=2GB"` |  |
| postgres.databaseName | string | `"mainnet2"` |  |
| postgres.fullnameOverride | string | `""` |  |
| postgres.image.pullPolicy | string | `"IfNotPresent"` |  |
| postgres.image.repository | string | `"postgres"` |  |
| postgres.image.tag | string | `"14"` |  |
| postgres.imagePullSecrets | list | `[]` |  |
| postgres.livenessProbe.initialDelaySeconds | int | `60` |  |
| postgres.livenessProbe.periodSeconds | int | `120` |  |
| postgres.livenessProbe.tcpSocket.port | string | `"postgres"` |  |
| postgres.nameOverride | string | `""` |  |
| postgres.password.default | string | `"zksync"` |  |
| postgres.password.fromSecret | bool | `false` |  |
| postgres.persistence.accessModes | list | `["ReadWriteOnce"]` | Access mode for the volume claim template |
| postgres.persistence.annotations | object | `{}` | Annotations for volume claim template |
| postgres.persistence.enabled | bool | `false` | Uses an EmptyDir when not enabled |
| postgres.persistence.existingClaim | string | `nil` | Use an existing PVC when persistence.enabled |
| postgres.persistence.selector | object | `{}` | Selector for volume claim template |
| postgres.persistence.size | string | `"1024Gi"` | Requested size for volume claim template |
| postgres.persistence.storageClassName | string | `nil` | Use a specific storage class E.g 'local-path' for local storage to achieve best performance Read more (https://github.com/rancher/local-path-provisioner) |
| postgres.readinessProbe.initialDelaySeconds | int | `10` |  |
| postgres.readinessProbe.periodSeconds | int | `10` |  |
| postgres.readinessProbe.tcpSocket.port | string | `"postgres"` |  |
| postgres.resources | object | `{}` |  |
| postgres.securityContext | object | `{}` |  |
| postgres.service.ports.postgres.port | int | `5432` |  |
| postgres.service.ports.postgres.protocol | string | `"TCP"` |  |
| postgres.service.type | string | `"ClusterIP"` |  |
| postgres.serviceAccount.annotations | object | `{}` |  |
| postgres.serviceAccount.create | bool | `true` |  |
| postgres.serviceAccount.name | string | `""` |  |
| postgres.user.default | string | `"zksync"` |  |
| postgres.user.fromSecret | bool | `false` |  |
| readinessProbe.httpGet.path | string | `"/health"` |  |
| readinessProbe.httpGet.port | string | `"healthcheck"` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| restoreDump | object | `{"enabled":true,"snapshotUrl":"zksync-era-mainnet-external-node-snapshots"}` | Download from snapshot. will run snapshot sync before starting node in an initContainer. refer to https://github.com/matter-labs/ansible-en-role?tab=readme-ov-file#step-by-step-guide |
| rustLog | string | `"zksync_external_node=info,zksync_core=info,zksync_core::sync_layer=info,zksync_server=info,zksync_prover=info,zksync_contract_verifier=info,zksync_dal=info,zksync_eth_client=info,zksync_storage=info,zksync_db_manager=info,zksync_merkle_tree=info,zksync_state=info,zksync_utils=info,zksync_types=info,loadnext=info,dev_ticker=info,vm=info,block_sizes_test=info,zksync_verification_key_generator_and_server=info,zksync_object_store=info,setup_key_generator_and_server=info,zksync_circuit_synthesizer=info,zksync_queued_job_processor=info,zksync_health_check=info"` |  |
| securityContext | object | `{}` |  |
| service.ports.healthcheck.port | int | `3081` |  |
| service.ports.healthcheck.protocol | string | `"TCP"` |  |
| service.ports.http.port | int | `3060` |  |
| service.ports.http.protocol | string | `"TCP"` |  |
| service.ports.ws.port | int | `3061` |  |
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
| wsPort | int | `3061` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
