# thumbor

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.1.1](https://img.shields.io/badge/AppVersion-7.1.1-informational?style=flat-square)

Thumbor(https://github.com/thumbor/thumbor) Helm chart.

**Homepage:** <http://www.thumbor.org/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Guilherme Souza | <101073+guilhermef@users.noreply.github.com> | <https://github.com/guilhermef> |

## Source Code

* <https://github.com/thumbor/helm/tree/main/charts/thumbor>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 2.x.x |
| https://charts.bitnami.com/bitnami | redis | 17.3.x |

## ⚙️ Usage
```bash
helm repo add thumbor https://thumbor.github.io/helm
helm install thumbor thumbor/thumbor
```

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
			<td>define affinities for the thumbor pod</td>
		</tr>
		<tr>
			<td>autoscaling.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>enable autoscaling via the HorizontalPodAutoscaler for the thumbor deployment Your Cluster needs to support this!</td>
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
			<td>env</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>environment variables for the thumbor pod</td>
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
			<td>override pullPolicy for thumbor image</td>
		</tr>
		<tr>
			<td>image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"ghcr.io/thumbor/thumbor"
</pre>
</td>
			<td>Overrides the image</td>
		</tr>
		<tr>
			<td>image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"7-py-3.10"
</pre>
</td>
			<td>Overrides the image tag whose default is the chart appVersion.</td>
		</tr>
		<tr>
			<td>imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>if the used image is not public</td>
		</tr>
		<tr>
			<td>ingress.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>ingress annotations</td>
		</tr>
		<tr>
			<td>ingress.className</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>specify ingress class or leave blank for the default ingress class</td>
		</tr>
		<tr>
			<td>ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>enable ingress</td>
		</tr>
		<tr>
			<td>ingress.hosts[0].host</td>
			<td>string</td>
			<td><pre lang="json">
"chart-example.local"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.hosts[0].paths[0].path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.hosts[0].paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"ImplementationSpecific"
</pre>
</td>
			<td>if errors occure use Prefix</td>
		</tr>
		<tr>
			<td>ingress.tls</td>
			<td>list</td>
			<td><pre lang="json">
[]
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
			<td>deploy thumbor to a specific node</td>
		</tr>
		<tr>
			<td>podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>optional pod Annotations</td>
		</tr>
		<tr>
			<td>podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>optional podSecurityContext settings</td>
		</tr>
		<tr>
			<td>redis.image.registry</td>
			<td>string</td>
			<td><pre lang="json">
"docker.io"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>redis.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"redis"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>redis.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"7.0"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>redis.replica.replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td>increase this option if you need replicas</td>
		</tr>
		<tr>
			<td>remotecv.affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>define affinities for the thumbor remotecv pod</td>
		</tr>
		<tr>
			<td>remotecv.autoscaling.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>enable autoscaling via the HorizontalPodAutoscaler for the remotecv deployment Your Cluster needs to support this!</td>
		</tr>
		<tr>
			<td>remotecv.autoscaling.maxReplicas</td>
			<td>int</td>
			<td><pre lang="json">
100
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.autoscaling.minReplicas</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.autoscaling.targetCPUUtilizationPercentage</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.env.HTTP_SERVER_PORT</td>
			<td>string</td>
			<td><pre lang="json">
"8080"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.env.REDIS_HOST</td>
			<td>string</td>
			<td><pre lang="json">
"thumbor-redis-master"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.env.REDIS_PASSWORD.valueFrom.secretKeyRef.key</td>
			<td>string</td>
			<td><pre lang="json">
"redis-password"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.env.REDIS_PASSWORD.valueFrom.secretKeyRef.name</td>
			<td>string</td>
			<td><pre lang="json">
"thumbor-redis"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.env.REDIS_PORT</td>
			<td>string</td>
			<td><pre lang="json">
"6379"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.env.WITH_HEALTHCHECK</td>
			<td>string</td>
			<td><pre lang="json">
"1"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"ghcr.io/thumbor/remotecv"
</pre>
</td>
			<td>Overrides the remotecv image</td>
		</tr>
		<tr>
			<td>remotecv.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"3-py-3.11"
</pre>
</td>
			<td>Overrides the image tag whose default is the chart appVersion.</td>
		</tr>
		<tr>
			<td>remotecv.installRedis</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>set this to false if you want to use an already existing redis server</td>
		</tr>
		<tr>
			<td>remotecv.nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>deploy thumbor remotecv to a specific node</td>
		</tr>
		<tr>
			<td>remotecv.podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>add podAnnotations tho the thumbor remotecv pod</td>
		</tr>
		<tr>
			<td>remotecv.replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>how many remotecv pod do you want</td>
		</tr>
		<tr>
			<td>remotecv.resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>remotecv.tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>define tolerations for the thumbor remotecv pod</td>
		</tr>
		<tr>
			<td>replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>how many thumbor pods should be deployed</td>
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
			<td>securityContext for the thumbor container</td>
		</tr>
		<tr>
			<td>service.port</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td>Thumbor service port thumbor uses container Port 80</td>
		</tr>
		<tr>
			<td>service.type</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIP"
</pre>
</td>
			<td>Thumbor service type</td>
		</tr>
		<tr>
			<td>serviceAccount.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Annotations to add to the service account</td>
		</tr>
		<tr>
			<td>serviceAccount.create</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Specifies whether a service account should be created</td>
		</tr>
		<tr>
			<td>serviceAccount.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The name of the service account to use. If not set and create is true, a name is generated using the fullname template</td>
		</tr>
		<tr>
			<td>thumbor_config</td>
			<td>string</td>
			<td><pre lang="json">
"AUTO_WEBP = True\n"
</pre>
</td>
			<td>configuration file for thumbor</td>
		</tr>
		<tr>
			<td>thumbor_existing_secret</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>if you have already an secret with the thumbor key</td>
		</tr>
		<tr>
			<td>thumbor_key.manage</td>
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
			<td>define tolerations for the thumbor pod</td>
		</tr>
	</tbody>
</table>

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
