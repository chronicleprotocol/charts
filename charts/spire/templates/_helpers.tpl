{{/*
Expand the name of the chart.
*/}}
{{- define "spire.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "spire.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "spire.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "spire.labels" -}}
helm.sh/chart: {{ include "spire.chart" . }}
{{ include "spire.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "spire.selectorLabels" -}}
app.kubernetes.io/name: {{ include "spire.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "spire.portNumber" -}}
{{- $portName := . -}}
{{- $ports := . -}}
{{- range $ports }}
{{- if eq .name $portName }}
{{- .port }}
{{- end }}
{{- end }}
{{- end }}


{{- define "spire.webapiPort" -}}
{{- $webapiPort := template "spire.portNumber" (list .Values.service.ports "webapi") -}}
{{- end }}

{{- define "spire.rpcPort" -}}
{{- $rpcPort := template "spire.portNumber" (list .Values.service.ports "rpc") -}}
{{- $rpcPort -}}
{{- end }}

{{- define "spire.listenerPort" -}}
{{- $listenerPort := template "spire.portNumber" (list .Values.service.ports "listener") -}}
{{- $listenerPort -}}
{{- end }}
