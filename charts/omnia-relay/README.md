# omnia-relay

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.1](https://img.shields.io/badge/AppVersion-1.16.1-informational?style=flat-square)

A Helm chart for deploying an Omnia relay in Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://chronicleprotocol.github.io/charts/ | spire | 0.0.6 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| ethereum.ethRpc | string | `"https://ethereum-goerli-rpc.allthatnode.com"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/chronicleprotocol/omnia_relay"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| keystore.enabled | bool | `true` |  |
| keystore.ethFromAddress | string | `"0xA23184c1Ac6F51c4b1b462c108E4652Dc9B4f5A6"` |  |
| keystore.keyStoreFile | string | `"{\"address\":\"a23184c1ac6f51c4b1b462c108e4652dc9b4f5a6\",\"id\":\"073dd01b-1b87-46b4-b52f-ca243bcf4b7b\",\"version\":3,\"Crypto\":{\"cipher\":\"aes-128-ctr\",\"cipherparams\":{\"iv\":\"8491d0eb057afca54a339c25163a6928\"},\"ciphertext\":\"006b10186ff3f4b9b1638ad176a83cd02eb8b6d687e651bad2e38fb91060e68d\",\"kdf\":\"scrypt\",\"kdfparams\":{\"salt\":\"1010801fe1140932f9a078010236292a481dc065b5bacb1aca8d7178d164340f\",\"n\":131072,\"dklen\":32,\"p\":1,\"r\":8},\"mac\":\"d91389bec6bcded7d67fd587b8c08a1136612eda15de88bf881d61ad46827674\"},\"crypto\":{\"cipher\":\"aes-128-ctr\",\"cipherparams\":{\"iv\":\"8491d0eb057afca54a339c25163a6928\"},\"ciphertext\":\"006b10186ff3f4b9b1638ad176a83cd02eb8b6d687e651bad2e38fb91060e68d\",\"kdf\":\"scrypt\",\"kdfparams\":{\"salt\":\"1010801fe1140932f9a078010236292a481dc065b5bacb1aca8d7178d164340f\",\"n\":131072,\"dklen\":32,\"p\":1,\"r\":8},\"mac\":\"d91389bec6bcded7d67fd587b8c08a1136612eda15de88bf881d61ad46827674\"}}"` |  |
| keystore.password | string | `"ilikeapples"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| omniaConfig.pairs | list | `[]` |  |
| omniaConfig.scuttlebotIdMap | list | `[]` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.ports.listener.port | int | `8100` |  |
| service.ports.listener.protocol | string | `"TCP"` |  |
| service.ports.rpc.port | int | `9100` |  |
| service.ports.rpc.protocol | string | `"TCP"` |  |
| service.ports.webapi.port | int | `8800` |  |
| service.ports.webapi.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| spire.configHcl | object | `{}` |  |
| spire.enabled | bool | `true` |  |
| spire.env.normal.CFG_LIBP2P_ENABLE | bool | `true` |  |
| spire.env.normal.CFG_WEBAPI_LISTEN_ADDR | string | `"0.0.0.0:8080"` |  |
| spire.env.normal.CFG_WEBAPI_SOCKS5_PROXY_ADDR | string | `"relay-tor-proxy:9050"` |  |
| spire.fullnameOverride | string | `"relay-spire"` |  |
| spire.logLevel | string | `"debug"` |  |
| spire.service.ports.libp2p.port | int | `8000` |  |
| spire.service.ports.libp2p.protocol | string | `"TCP"` |  |
| spire.service.ports.rpc.port | int | `9100` |  |
| spire.service.ports.rpc.protocol | string | `"TCP"` |  |
| spire.service.ports.webapi.port | int | `8080` |  |
| spire.service.ports.webapi.protocol | string | `"TCP"` |  |
| spire.tor-proxy.enabled | bool | `true` |  |
| spire.tor-proxy.env.normal.TOR_EXTRA_ARGS | string | `"AutomapHostsOnResolve 1\nControlSocketsGroupWritable 1\nCookieAuthentication 1\nCookieAuthFileGroupReadable 1\nDNSPort 5353\nExitPolicy reject *:*\nLog notice stderr\nRunAsDaemon 0\nControlSocket /home/tor/.tor/control_socket\nCookieAuthFile /home/tor/.tor/control_socket.authcookie\nDataDirectory /home/tor/.tor\nHiddenServiceDir /var/lib/tor/hidden_services\nHiddenServicePort 8888 relay-spire:8080\nHiddenServiceVersion\n"` |  |
| spire.tor-proxy.fullnameOverride | string | `"relay-tor-proxy"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
