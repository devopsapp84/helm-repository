# helm-repository
Self hosted helm repository for backstage


## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```console
helm repo add selfrepo https://devopsapp84.github.io/helm-repository
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo
test` to see the charts.

To install the istiod chart:
```console
helm install backstage selfrepo/backstage
```

To uninstall the chart:
```console
helm delete backstage
```