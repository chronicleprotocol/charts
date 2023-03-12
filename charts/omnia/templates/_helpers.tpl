{{/*
Expand the name of the chart.
*/}}
{{- define "omnia.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "omnia.fullname" -}}
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
{{- define "omnia.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "omnia.labels" -}}
helm.sh/chart: {{ include "omnia.chart" . }}
{{ include "omnia.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "omnia.selectorLabels" -}}
app.kubernetes.io/name: {{ include "omnia.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "omnia.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "omnia.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create secret env vars from a values.env
*/}}

{{- define "helpers.secret-env-variables"}}
{{- $secretName := printf "%s-vars" .Release.Name -}}
{{- range $key, $val := .Values.env.secret }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: {{ $secretName }}
      key: {{ $key }}
{{- end}}
{{- end}}

{{/*
Create normal env vars from list
*/}}
{{- define "helpers.list-env-variables"}}
{{- range $key, $val := .Values.env.normal }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end }}
{{- end }}
