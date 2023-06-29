# omnia-relay

![Version: 0.0.8](https://img.shields.io/badge/Version-0.0.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.1-dev.2](https://img.shields.io/badge/AppVersion-1.16.1--dev.2-informational?style=flat-square)

A Helm chart for deploying an Omnia relay in Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://chronicleprotocol.github.io/charts/ | spire | 0.1.0 |
| https://chronicleprotocol.github.io/charts/ | ssb-server | 0.0.2 |

## Values

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>autoscaling.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>autoscaling.maxReplicas</td>
			<td>int</td>
			<td><pre lang="json">
100
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>autoscaling.minReplicas</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>autoscaling.targetCPUUtilizationPercentage</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env.normal.CFG_SPIRE_RPC_ADDR</td>
			<td>string</td>
			<td><pre lang="json">
"relay-spire:9100"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env.normal.OMNIA_CONFIG</td>
			<td>string</td>
			<td><pre lang="json">
"/config/omnia/omnia.json"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ethereum.ethRpc</td>
			<td>string</td>
			<td><pre lang="json">
"https://eth.public-rpc.com"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ethereum.gasPrice.maxPriceMultiplier</td>
			<td>int</td>
			<td><pre lang="json">
2
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ethereum.gasPrice.priority</td>
			<td>string</td>
			<td><pre lang="json">
"fast"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ethereum.gasPrice.source</td>
			<td>string</td>
			<td><pre lang="json">
"node"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ethereum.gasPrice.tipMultiplier</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>extraObjects</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Extra K8s manifests to deploy</td>
		</tr>
		<tr>
			<td>fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"ghcr.io/chronicleprotocol/omnia_relay"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>image.tag</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keystore.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keystore.ethFromAddress</td>
			<td>string</td>
			<td><pre lang="json">
"0xA23184c1Ac6F51c4b1b462c108E4652Dc9B4f5A6"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keystore.existingSecret</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keystore.keyStoreFile</td>
			<td>string</td>
			<td><pre lang="json">
"{\"address\":\"a23184c1ac6f51c4b1b462c108e4652dc9b4f5a6\",\"id\":\"073dd01b-1b87-46b4-b52f-ca243bcf4b7b\",\"version\":3,\"Crypto\":{\"cipher\":\"aes-128-ctr\",\"cipherparams\":{\"iv\":\"8491d0eb057afca54a339c25163a6928\"},\"ciphertext\":\"006b10186ff3f4b9b1638ad176a83cd02eb8b6d687e651bad2e38fb91060e68d\",\"kdf\":\"scrypt\",\"kdfparams\":{\"salt\":\"1010801fe1140932f9a078010236292a481dc065b5bacb1aca8d7178d164340f\",\"n\":131072,\"dklen\":32,\"p\":1,\"r\":8},\"mac\":\"d91389bec6bcded7d67fd587b8c08a1136612eda15de88bf881d61ad46827674\"},\"crypto\":{\"cipher\":\"aes-128-ctr\",\"cipherparams\":{\"iv\":\"8491d0eb057afca54a339c25163a6928\"},\"ciphertext\":\"006b10186ff3f4b9b1638ad176a83cd02eb8b6d687e651bad2e38fb91060e68d\",\"kdf\":\"scrypt\",\"kdfparams\":{\"salt\":\"1010801fe1140932f9a078010236292a481dc065b5bacb1aca8d7178d164340f\",\"n\":131072,\"dklen\":32,\"p\":1,\"r\":8},\"mac\":\"d91389bec6bcded7d67fd587b8c08a1136612eda15de88bf881d61ad46827674\"}}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keystore.password</td>
			<td>string</td>
			<td><pre lang="json">
"ilikeapples"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.chainType</td>
			<td>string</td>
			<td><pre lang="json">
"ethereum"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.debug</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.logFile</td>
			<td>string</td>
			<td><pre lang="json">
"json"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.sleep</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.spireJson</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.transports[0]</td>
			<td>string</td>
			<td><pre lang="json">
"spire"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.verbose</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>securityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceAccount.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceAccount.create</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceAccount.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.configHcl</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.env.normal.CFG_FEEDS</td>
			<td>string</td>
			<td><pre lang="json">
"prod"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.env.normal.CFG_LIBP2P_ENABLE</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.env.normal.CFG_WEBAPI_LISTEN_ADDR</td>
			<td>string</td>
			<td><pre lang="json">
"0.0.0.0:8080"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.env.normal.CFG_WEBAPI_SOCKS5_PROXY_ADDR</td>
			<td>string</td>
			<td><pre lang="json">
"relay-tor-proxy:9050"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
"relay-spire"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"0.11.0-dev.7"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.logLevel</td>
			<td>string</td>
			<td><pre lang="json">
"debug"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.service.ports.libp2p.port</td>
			<td>int</td>
			<td><pre lang="json">
8000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.service.ports.libp2p.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.service.ports.rpc.port</td>
			<td>int</td>
			<td><pre lang="json">
9100
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.service.ports.rpc.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.service.ports.webapi.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.service.ports.webapi.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.tor-proxy.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.tor-proxy.env.normal.TOR_EXTRA_ARGS</td>
			<td>string</td>
			<td><pre lang="json">
"AutomapHostsOnResolve 1\nControlSocketsGroupWritable 1\nCookieAuthentication 1\nCookieAuthFileGroupReadable 1\nDNSPort 5353\nExitPolicy reject *:*\nLog notice stderr\nRunAsDaemon 0\nControlSocket /home/tor/.tor/control_socket\nCookieAuthFile /home/tor/.tor/control_socket.authcookie\nDataDirectory /home/tor/.tor\nHiddenServiceDir /var/lib/tor/hidden_services\nHiddenServicePort 8888 relay-spire:8080\nHiddenServiceVersion\n"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>spire.tor-proxy.fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
"relay-tor-proxy"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ssb-server.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
	</tbody>
</table>

> **Tip**: If you are providing a secret for `.Values.keystore.existingSecret`, use the following command:

```bash
kubectl create secret generic my-secret --from-file=keystoreFile=/path/to/keystore.json --from-file=password=/path/to/password.txt
```
