{{/* Namespace name defaults to the team name. */}}
{{- define "cost-guardrails.namespace" -}}
{{- default .Values.team .Values.namespaceName -}}
{{- end -}}

{{/* Cost-allocation labels applied to every rendered resource. */}}
{{- define "cost-guardrails.labels" -}}
team: {{ .Values.team | quote }}
cost-center: {{ .Values.costCenter | quote }}
environment: {{ .Values.environment | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}
