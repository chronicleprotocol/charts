# safe-watcher

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.2.1](https://img.shields.io/badge/AppVersion-1.2.1-informational?style=flat-square)

A Helm chart for deploy Safe-Watcher to Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake/> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Source Code

* <https://github.com/Gearbox-protocol/safe-watcher>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| configYaml | object | `{}` | inline plain text config, if empty, app expects an existing CM |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/gearbox-protocol/safe-watcher"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| livenessProbe | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceAccount | object | `{"annotations":{},"automount":true,"create":true,"name":""}` | This section builds out the service account more information can be found here: https://kubernetes.io/docs/concepts/security/service-accounts/ |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[{"mountPath":"/app/config.yaml","name":"config","subPath":"config.yaml"}]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[{"configMap":{"items":[{"key":"config.yaml","path":"config.yaml"}],"name":"safe-watcher-config"},"name":"config"}]` | Default for CM, but you can also set it to your own CM instead of supplying values inline |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
