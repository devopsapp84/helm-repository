# Backstage development helm charts

This folder contains Helm charts that can easily create a Kubernetes deployment of a demo Backstage app.

### Pre-requisites
You don't need to have nginx ingersss controller cause istio will be use instead.

### Installing the charts

After choosing a DNS name where backstage will be hosted create a yaml file for your custom configuration.

```yaml
appConfig:
  app:
    baseUrl: https://backstage.<your k3d lb ip>.nip.io
    title: Backstage Dev K8s
  backend:
    baseUrl: https://backstage.<your k3d lb ip>.nip.io
    cors:
      origin: https://backstage.<your k3d lb ip>.nip.io
  lighthouse:
    baseUrl: https://backstage.<your k3d lb ip>.nip.io/lighthouse-api
  techdocs:
    storageUrl: https://backstage.<your k3d lb ip>.nip.io/api/techdocs/static/docs
    requestUrl: https://backstage.<your k3d lb ip>.nip.io/api/techdocs
```

Then use it to run:

```shell
git clone https://github.com/devopsapp84/helm-repository
cd charts/backstage-dev
helm dependency update
helm install -f values-override.yaml backstage .
```

This command will deploy the following pieces:

- Backstage frontend
- Backstage backend with scaffolder and auth plugins
- PostgreSQL instance
- lighthouse plugin

After a few minutes Backstage should be up and running in your cluster under the DNS specified earlier.

Make sure to create the appropriate DNS entry in your infrastructure. To find the public IP address run:

```shell
$ kubectl get vs -A backstage
```

### Github authentication via Oauth App
To have this please create oAuth application within Developer settings and then add override config

```yaml
auth:
  github:
    clientId: 
    clientSecret: 
  githubToken: 
```

Have look on example values-override.yaml

### Your own examples
If you really want to have own examples loaded during backstage initial process you must set

```yaml
appConfig:
  app:
    ghorg: <your github organization belong to>
```
