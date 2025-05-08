{{/*
Expand the name of the chart.
*/}}
{{- define "validator.name" -}}
{{- default .Chart.Name .Values.ghost.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "validator.fullname" -}}
{{- if .Values.ghost.fullnameOverride }}
{{- .Values.ghost.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.ghost.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "validator.fullname2" -}}
{{- if .ghost.fullnameOverride }}
{{- .vals.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .chartName .ghost.nameOverride }}
{{- if contains $name .releaseName }}
{{- .releaseName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .releaseName $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "validator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "validator.labels" -}}
helm.sh/chart: {{ include "validator.chart" . }}
{{ include "validator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "validator.selectorLabels" -}}
app.kubernetes.io/name: ghost
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "validator.serviceAccountName" -}}
{{- if .Values.ghost.serviceAccount.create }}
{{- default (include "validator.fullname" .) .Values.ghost.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.ghost.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "ghost.container" -}}
securityContext:
  {{- toYaml .ghost.securityContext | nindent 8 }}
image: "{{ .ghost.image.repository }}:{{ .ghost.image.tag | default .chartVersion }}"
{{- if .ghost.commandOverride }}
command:
{{- range .ghost.commandOverride }}
  - {{ . | quote }}
{{- end }}
{{- end }}
{{- if .ghost.argsOverride }}
args:
{{- range .ghost.argsOverride }}
  - {{ . | quote }}
{{- end }}
{{- end }}
imagePullPolicy: {{ .ghost.image.pullPolicy }}
ports:
{{- range $key, $val := .ghost.service.ports }}
  - name: {{ $key }}
    containerPort: {{ $val.port }}
    protocol: {{ $val.protocol }}
{{- end }}
{{- if .ghost.metrics.enabled }}
  - containerPort: {{ .ghost.metrics.port }}
    name: metrics
    protocol: TCP
{{- end }}
{{- if .ghost.liveness.enabled }}
{{- if or (not .ghost.readiness.enabled) (and .ghost.readiness.enabled (ne .ghost.liveness.livenessProbe.httpGet.port .ghost.readiness.readinessProbe.httpGet.port))}}
  - containerPort: {{ .ghost.liveness.livenessProbe.httpGet.port }}
    name: probeLive
    protocol: TCP
{{- end }}
{{- end }}
{{- if .ghost.readiness.enabled }}
{{- if or (not .ghost.liveness.enabled) (and .ghost.liveness.enabled (ne .ghost.readiness.readinessProbe.httpGet.port .ghost.liveness.livenessProbe.httpGet.port))}}
  - containerPort: {{ .ghost.readiness.readinessProbe.httpGet.port }}
    name: probeReady
    protocol: TCP
{{- end }}
{{- end }}
{{- if .ghost.liveness.enabled }}
livenessProbe:
  {{- toYaml .ghost.liveness.livenessProbe | nindent 8 }}
{{- end }}
{{- if .ghost.readiness.enabled }}
readinessProbe:
  {{- toYaml .ghost.readiness.readinessProbe | nindent 8 }}
{{- end }}
env:
  ### -- WATCHDOG
  - name: WATCHDOG_CONFIG_REGISTRY
    value: {{ .ghost.watchdogConfigReg | quote }}
{{- if .ghost.watchdogInterval }}
  - name: WATCHDOG_INTERVAL
    value: {{ .ghost.watchdogInterval | quote }}
  - name: WATCHDOG_SCHEDULE
    value: ""
{{- end }}
  ### -- LIBP2P
  - name: CFG_LIBP2P_LISTEN_ADDRS
    value: "/ip4/0.0.0.0/tcp/{{ .ghost.service.ports.libp2p.port | default 8000 }}"
{{- if .ghost.ingress.enabled }}
{{- range .ghost.ingress.hosts }}
  - name: CFG_LIBP2P_EXTERNAL_ADDR
    value: "/dns/{{ .host }}"
{{- end }}
{{- end }}
  ### -- WEB API
  {{- if .ghost.webApi.enabled }}
  - name: CFG_WEBAPI_ENABLE
    value: {{ .ghost.webApi.enabled | quote }}
  - name: CFG_WEBAPI_LISTEN_ADDR
    value: {{ .ghost.webApi.listenAddr | quote }}
  - name: CFG_WEBAPI_SOCKS5_PROXY_ADDR
    value: "{{ include "validator.fullname2" . }}-socks-tor-svc:9050"
  - name: CFG_WEB_URL
    valueFrom:
      secretKeyRef:
        name: {{ include "validator.fullname2" . }}-tor-secret
        key: onionAddress
  {{- end }}
    ### -- CHAIN and RPC (target or main chain)
  - name: CFG_CHAIN_NAME
    value: {{ .ghost.chainName | default "eth" | quote }}
  - name: CFG_CHAIN_ID
    value: {{ .ghost.chainId | default "1" | quote }}
    {{- if .ghost.chainRpcUrl }}
  - name: CFG_CHAIN_RPC_URLS
    value: {{ .ghost.chainRpcUrl | quote }}
    {{- else if .ghost.rpcUrl }}
  - name: CFG_CHAIN_RPC_URLS
    value: {{ .ghost.rpcUrl | quote }}
    {{- end }}
    {{- if .ghost.chainTxType }}
  - name: CFG_CHAIN_TX_TYPE
    value: {{ .ghost.chainTxType | default "eip1559" quote }}
    {{- end }}
### -- ETH KEYSTORE FROM EXISTING SECRET
{{- if .ghost.ethConfig }}
  - name: CFG_ETH_FROM
    valueFrom:
      secretKeyRef:
        name: {{ .ghost.ethConfig.ethFrom.existingSecret }}
        key: {{ .ghost.ethConfig.ethFrom.key }}
  - name: CFG_ETH_KEYS
    valueFrom:
      secretKeyRef:
        name: {{ .ghost.ethConfig.ethKeys.existingSecret }}
        key: {{ .ghost.ethConfig.ethKeys.key }}
  - name: CFG_ETH_PASS
    valueFrom:
      secretKeyRef:
        name: {{ .ghost.ethConfig.ethPass.existingSecret }}
        key: {{ .ghost.ethConfig.ethPass.key }}
{{- end }}
### Logging
  - name: CFG_LOG_LEVEL
    value: {{ .ghost.logLevel | default "warning" | quote }}
  - name: CFG_LOG_FORMAT
    value: {{ .ghost.logFormat | default "text" | quote }}
### -- ADDITIONAL ENV VARS FROM `.ghost.env.normal`
{{- range $key, $val := .ghost.env.normal }}
  - name: {{ $key }}
    value: {{ $val | quote }}
{{- end }}
{{- if .ghost.service.type | quote | eq "NodePort" }}
  - name: CFG_LIBP2P_EXTERNAL_IP
    valueFrom:
      configMapKeyRef:
        name: {{ include "validator.fullname2" . }}-podinfo
        key: PUBLIC_IP
  - name: PUBLIC_IP
    valueFrom:
      configMapKeyRef:
        name: {{ include "validator.fullname2" . }}-podinfo
        key: PUBLIC_IP
  - name: NODE_PORT
    valueFrom:
      configMapKeyRef:
        name: {{ include "validator.fullname2" . }}-podinfo
        key: NODE_PORT
{{- end }}
resources:
  {{- toYaml .ghost.resources | nindent 8 }}
{{- end }}
