{{- define "gofer.configHcl" -}}
{{- .Files.Get "config.tpl" | trim | indent 4 -}}
{{- end -}}
