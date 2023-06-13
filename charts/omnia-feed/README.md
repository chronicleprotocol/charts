# omnia-feed

![Version: 0.0.4](https://img.shields.io/badge/Version-0.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.15.2-rc.0](https://img.shields.io/badge/AppVersion-1.15.2--rc.0-informational?style=flat-square)

A Helm chart for deploying an Omnia relay in Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake> |
| chronicleprotocol |  | <https://github.com/chronicleprotocol> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://chronicleprotocol.github.io/charts/ | gofer | 0.0.3 |
| https://chronicleprotocol.github.io/charts/ | spire | 0.0.8 |
| https://chronicleprotocol.github.io/charts/ | ssb-server | 0.0.1 |

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
			<td>ethereum.ethRpc</td>
			<td>string</td>
			<td><pre lang="json">
"https://ethereum-goerli-rpc.allthatnode.com"
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
			<td>gofer.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
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
"0x0000000000000000000000000000000000000000"
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
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>keystore.password</td>
			<td>string</td>
			<td><pre lang="json">
""
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
			<td>omniaConfig.pairs</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x0c4FC7D66b7b6c684488c1F218caA18D4082da18</td>
			<td>string</td>
			<td><pre lang="json">
"@4ltZDRGFi4eHGGlXmLC8olcEs8XNZCXfvx+3V3S2HgY=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x5C01f0F08E54B85f4CaB8C6a03c9425196fe66DD</td>
			<td>string</td>
			<td><pre lang="json">
"@uqOcvBdpBXWNCm5WhjALbtyR8szWpihH/CVyNdycncQ=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x75FBD0aaCe74Fb05ef0F6C0AC63d26071Eb750c9</td>
			<td>string</td>
			<td><pre lang="json">
"@wrrCKd56pV5CNSVh+fkVh6iaRUG6VA5I5VDEo8XOn5E=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xC50DF8b5dcb701aBc0D6d1C7C99E6602171Abbc4</td>
			<td>string</td>
			<td><pre lang="json">
"@gt/2QK1AdSCLX3zRJQV6wRRsoxgohChCpjmNOOLUAA4=.ed25519"
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
"ssb"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.transports[1]</td>
			<td>string</td>
			<td><pre lang="json">
"spire"
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
true
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
