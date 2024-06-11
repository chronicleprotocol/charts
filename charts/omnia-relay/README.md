# omnia-relay

> **:exclamation: This Helm Chart is deprecated!**

![Version: 0.0.11](https://img.shields.io/badge/Version-0.0.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.2](https://img.shields.io/badge/AppVersion-1.16.2-informational?style=flat-square)

A Helm chart for deploying an Omnia relay in Kubernetes

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
			<td>env.normal.CFG_FEEDS</td>
			<td>string</td>
			<td><pre lang="json">
"prod"
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
			<td>env.normal.ETH_CHAIN_TYPE</td>
			<td>string</td>
			<td><pre lang="json">
"ethereum"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env.normal.ETH_RPC_URL</td>
			<td>string</td>
			<td><pre lang="json">
"https://eth-mainnet.public.blastapi.io"
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
			<td>env.normal.OMNIA_LOG_FORMAT</td>
			<td>string</td>
			<td><pre lang="json">
"text"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>env.normal.OMNIA_MODE</td>
			<td>string</td>
			<td><pre lang="json">
"relay"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ethereum.ethRpc</td>
			<td>string</td>
			<td><pre lang="json">
"https://eth-goerli.public.blastapi.io"
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
"Always"
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
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.ethGas</td>
			<td>int</td>
			<td><pre lang="json">
200000
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
			<td>omniaConfig.pairs[0].msgExpiration</td>
			<td>int</td>
			<td><pre lang="json">
1800
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[0].name</td>
			<td>string</td>
			<td><pre lang="json">
"BTC/USD"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[0].oracle</td>
			<td>string</td>
			<td><pre lang="json">
"0xe0F30cb149fAADC7247E953746Be9BbBB6B5751f"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[0].oracleExpiration</td>
			<td>int</td>
			<td><pre lang="json">
86400
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[0].oracleSpread</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[1].msgExpiration</td>
			<td>int</td>
			<td><pre lang="json">
1800
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[1].name</td>
			<td>string</td>
			<td><pre lang="json">
"ETH/USD"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[1].oracle</td>
			<td>string</td>
			<td><pre lang="json">
"0x64DE91F5A373Cd4c28de3600cB34C7C6cE410C85"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[1].oracleExpiration</td>
			<td>int</td>
			<td><pre lang="json">
86400
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.pairs[1].oracleSpread</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x130431b4560Cd1d74A990AE86C337a33171FF3c6</td>
			<td>string</td>
			<td><pre lang="json">
"@kqg/A1m9pdbGSylkUwnZJw7o7AtFBN8sFmXJ4xgwqcM=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x16655369Eb59F3e1cAFBCfAC6D3Dd4001328f747</td>
			<td>string</td>
			<td><pre lang="json">
"@q4XL6KymSI1WHuR+ZBgjCSj6N+dO8vuZuGCgQZq67Gw=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x3CB645a8f10Fb7B0721eaBaE958F77a878441Cb9</td>
			<td>string</td>
			<td><pre lang="json">
"@K5GMWYcMDFf7vJ14fU7GsydkeY5o3NQX0b+oui3DkEs=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x4b0E327C08e23dD08cb87Ec994915a5375619aa2</td>
			<td>string</td>
			<td><pre lang="json">
"@E7B3opUWe14hpOsPgOzW8YzZv46uus0vVVZtcZ3TQBo=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x4f95d9B4D842B2E2B1d1AC3f2Cf548B93Fd77c67</td>
			<td>string</td>
			<td><pre lang="json">
"@NmlE5G9XxgRfC8dxFY49t1iaB5O2i0VDLw7lhDWcmVo=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x60da93D9903cb7d3eD450D4F81D402f7C4F71dd9</td>
			<td>string</td>
			<td><pre lang="json">
"@+MXygz7HXiDdjXsQDbEkIFD8MOcWr+0Cn1529iwEVCI=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x71eCFF5261bAA115dcB1D9335c88678324b8A987</td>
			<td>string</td>
			<td><pre lang="json">
"@7y4tZnczYjjqXzMC32srHsCVMCaMs/mpkVgaDGdXOgM=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x75ef8432566A79C86BBF207A47df3963B8Cf0753</td>
			<td>string</td>
			<td><pre lang="json">
"@1eJfb61Dwk4Q4alBdjJPireI6sdtz4UtuJZ6qolbfo0=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x77EB6CF8d732fe4D92c427fCdd83142DB3B742f7</td>
			<td>string</td>
			<td><pre lang="json">
"@DY7va7XHwh7XTdA7x9Pnu0GS/O4beWsUQrVObikqclE=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x83e23C207a67a9f9cB680ce84869B91473403e7d</td>
			<td>string</td>
			<td><pre lang="json">
"@OWP0AueLTTGXKT2VikDUPdmd8oqAeN85iF1Tt+nz52U=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x8aFBD9c3D794eD8DF903b3468f4c4Ea85be953FB</td>
			<td>string</td>
			<td><pre lang="json">
"@amqs7YOREwqVSt+kVYcNNt6jHKrxFrIsSlUK1pTnqgo=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x8de9c5F1AC1D4d02bbfC25fD178f5DAA4D5B26dC</td>
			<td>string</td>
			<td><pre lang="json">
"@RaGo37sm5OZtxr16An3n0Lg7QUTp7TYroH8Kfl1DHRo=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0x8ff6a38A1CD6a42cAac45F08eB0c802253f68dfD</td>
			<td>string</td>
			<td><pre lang="json">
"@8zMLDDmm3zsrFhkX6Rum3uWZ3DoWAb6cGAO2CYnEi7I=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xA8EB82456ed9bAE55841529888cDE9152468635A</td>
			<td>string</td>
			<td><pre lang="json">
"@rgvhqaiHOxOCnnCFPFRv0REkcnQn8Xe9+AZs3sVL4+g=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xC9508E9E3Ccf319F5333A5B8c825418ABeC688BA</td>
			<td>string</td>
			<td><pre lang="json">
"@N2Yz4d5vzO882cfA9Ze9oVIsIzV+N6eU6uTe61gMfGk=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xD27Fa2361bC2CfB9A591fb289244C538E190684B</td>
			<td>string</td>
			<td><pre lang="json">
"@92ohB9a3bIScXuTRhzWqDiTUjk3CzEBpImSNilttIdQ=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xDA1d2961Da837891f43235FddF66BAD26f41368b</td>
			<td>string</td>
			<td><pre lang="json">
"@aGtbCUrDyGt+EcH0ppaqaC+L9XDUzwcbM2O1aK9nT84=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xE6367a7Da2b20ecB94A25Ef06F3b551baB2682e6</td>
			<td>string</td>
			<td><pre lang="json">
"@u9wofEvklVwnJdAmezxvLMwRp4xuSjahBzB0EL/Y8dg=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xFbaF3a7eB4Ec2962bd1847687E56aAEE855F5D00</td>
			<td>string</td>
			<td><pre lang="json">
"@549y65IgZK/KzcRM6KqYJlEJrqZeX1+XGIrPUGlXHHA=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xa580BBCB1Cee2BCec4De2Ea870D20a12A964819e</td>
			<td>string</td>
			<td><pre lang="json">
"@NkNJzUcy3dlO4V6QsyaQzs3eAbfd9jLKpOdIMyGHBcI=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xaC8519b3495d8A3E3E44c041521cF7aC3f8F63B3</td>
			<td>string</td>
			<td><pre lang="json">
"@DhbPmnvAEqXOCSYga4tD2wYBQ9nMb0uYJm8HDAPg/no=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xd72BA9402E9f3Ff01959D6c841DDD13615FFff42</td>
			<td>string</td>
			<td><pre lang="json">
"@4BW2SNFDeUeS5gVxk1QZRtoCpg5SSr+JKhx9/q6uAEw=.ed25519"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>omniaConfig.scuttlebotIdMap.0xd94BBe83b4a68940839cD151478852d16B3eF891</td>
			<td>string</td>
			<td><pre lang="json">
"@sbW7YaJfV+Cgu1BNafSbJ4LMRkUMdRjJoOal+iBp8fo=.ed25519"
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
			<td>podSecurityContext.fsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
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
			<td>securityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>securityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
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
