# {{/*
# Expand the name of the chart.
# */}}
# {{- define "thumbor.name" -}}
# {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
# {{- end }}

# {{/*
# Create a default fully qualified app name.
# We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
# If release name contains chart name it will be used as a full name.
# */}}
# {{- define "thumbor.fullname" -}}
# {{- if .Values.fullnameOverride }}
# {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
# {{- else }}
# {{- $name := default .Chart.Name .Values.nameOverride }}
# {{- if contains $name .Release.Name }}
# {{- .Release.Name | trunc 63 | trimSuffix "-" }}
# {{- else }}
# {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
# {{- end }}
# {{- end }}
# {{- end }}

# {{/*
# Create chart name and version as used by the chart label.
# */}}
# {{- define "thumbor.chart" -}}
# {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
# {{- end }}

# {{/*
# Common labels
# */}}
# {{- define "thumbor.labels" -}}
# helm.sh/chart: {{ include "thumbor.chart" . }}
# {{ include "thumbor.selectorLabels" . }}
# {{- if .Chart.AppVersion }}
# app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
# {{- end }}
# app.kubernetes.io/managed-by: {{ .Release.Service }}
# {{- end }}

# {{/*
# Selector labels
# */}}
# {{- define "thumbor.selectorLabels" -}}
# app.kubernetes.io/name: {{ include "thumbor.name" . }}
# app.kubernetes.io/instance: {{ .Release.Name }}
# {{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thumbor.serviceAccountName" -}}
    {{- if .Values.serviceAccount.create -}}
        {{- default (include "common.names.fullname" .) .Values.serviceAccount.name -}}
    {{- else -}}
        {{- default "default" .Values.serviceAccount.name -}}
    {{- end -}}
{{- end -}}

{{/*
Convert Key:Value to correct env var format
*/}}
{{- define "thumbor.envVars" -}}
    {{- with .Values.env -}}
        # create a empty resulsts list
        {{- $result := list -}}
        # loop over .Values.env with $key and $value
        {{- range $key, $value := . -}}
            # If value is a map it probably will be valueFrom
            {{- if kindIs "map" $value -}}
                # make sure it is realy a valueFrom a secret
                {{- if hasKey $value "valueFrom" -}}
                    # append results list with the corret valueFrom format
                    {{- $result = append $result (dict "name" $key "valueFrom" $value.valueFrom) -}}
                {{- end -}}
            {{- else -}}
                # if it is not a map, convert the value to string and append the results
                # with the expected env var dict
                {{- $result = append $result (dict "name" $key "value" ($value | toString)) -}}
            {{- end -}}
        {{- end -}}
        # return result array as yaml dict under the key 'env'
        {{- toYaml (dict "env" $result) | nindent 0 -}}
    {{- end -}}
{{- end -}}
