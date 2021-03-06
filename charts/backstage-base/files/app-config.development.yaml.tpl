backend:
  lighthouseHostname: {{ include "lighthouse.serviceName" . | quote }}
  listen:
      port: {{ .Values.appConfig.backend.listen.port | default 7007 }}
  database:
    client: {{ .Values.appConfig.backend.database.client | quote }}
    connection:
      host: {{ include "backend.postgresql.host" . | quote }}
      port: {{ include "backend.postgresql.port" . | quote }}
      user: {{ include "backend.postgresql.user" . | quote }}
      database: {{ .Values.appConfig.backend.database.connection.database | quote }}
      ssl:
        rejectUnauthorized: {{ .Values.appConfig.backend.database.connection.ssl.rejectUnauthorized | quote }}
        ca: {{ include "backstage.backend.postgresCaFilename" . | quote }}

catalog:
{{- if .Values.backend.demoData }}
  locations:
    # Backstage DevopsApp84 private repo
    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/backstage/blob/main/packages/catalog-model/examples/all-components.yaml

    # Backstage example systems
    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/backstage/blob/main/packages/catalog-model/examples/all-systems.yaml

    # Backstage example APIs
    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/backstage/blob/main/packages/catalog-model/examples/all-apis.yaml

    # Backstage example resources
    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/backstage/blob/main/packages/catalog-model/examples/all-resources.yaml

    # Backstage example organization groups
    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/backstage/blob/main/packages/catalog-model/devopsapp84/users/org.yaml

    # Backstage example templates
    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/software-templates/blob/main/scaffolder-templates/react-ssr-template/template.yaml

    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/software-templates/blob/main/scaffolder-templates/springboot-grpc-template/template.yaml

    - type: url
      target: https://github.com/{{ .Values.appConfig.app.ghorg }}/software-templates/blob/main/scaffolder-templates/docs-template/template.yaml
{{- else }}
  locations: []
{{- end }}

auth:
  providers:
    microsoft: null

scaffolder:
  azure: null


sentry:
  organization: {{ .Values.appConfig.sentry.organization | quote }}

techdocs:
  generator: 
    runIn: 'local'
