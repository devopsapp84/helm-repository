# Backstage demo helm charts

This folder contains Helm charts that can easily create a Kubernetes deployment of a demo Backstage app.

### Installing the charts

After choosing a DNS name where backstage will be hosted create a yaml file for your custom configuration.

```yaml
appConfig:
  app:
    baseUrl: https://backstage.<your domain>
    title: Backstage
  backend:
    baseUrl: https://backstage.<your domain>
    cors:
      origin: https://backstage.<your domain>
  lighthouse:
    baseUrl: https://backstage.<your domain>/lighthouse-api
  techdocs:
    storageUrl: https://backstage.<your domain>/api/techdocs/static/docs
    requestUrl: https://backstage.<your domain>/api/techdocs
```

Then use it to run:

```shell
helm repo add selfrepo https://devopsapp84.github.io/helm-repository
helm install <your domain name>.yaml selfrepo/backstage -n <your namespace> --create-namespace
```

This command will deploy the following pieces:

- Backstage frontend
- Backstage backend with scaffolder and auth plugins
- a PostgreSQL instance
- lighthouse plugin

After a few minutes Backstage should be up and running in your cluster under the DNS specified earlier.

## Uninstalling Backstage

To uninstall Backstage simply run:

```shell
RELEASE_NAME=<release-name> # use `helm list` to find out the name
RELEASE_NAME_SPACE=<your namespace>
helm uninstall ${RELEASE_NAME}
kubectl delete ns $RELEASE_NAME_SPACE
```