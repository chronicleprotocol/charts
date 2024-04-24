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
