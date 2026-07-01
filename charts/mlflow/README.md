# mlflow

Helm chart for **mlflow** — MLflow is an open-source platform designed to manage the end-to-end machine learning lifecycle. It allows you to track experiments, package code into reproducible runs, and share and deploy models.

[Upstream project](https://mlflow.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mlflow
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/mlflow --version 5.3.0
```

## Configuration

The full list of tunables lives in [`values.yaml`](values.yaml). Most deployments
only touch a handful of values:

- `image.repository` / `image.tag` — container image (defaults to a
 `-nixchart` variant published from this repo)
- `resources` — CPU/memory requests + limits (or `resourcesPreset`)
- `persistence.enabled` — enable a PersistentVolumeClaim
- `service.type` — `ClusterIP` / `NodePort` / `LoadBalancer`
- `podSecurityContext` / `containerSecurityContext` — pod- and
 container-level security controls

## Images used

- [`git-nixchart`](../../images/git-nixchart/)
- [`mlflow-nixchart`](../../images/mlflow-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/mlflow>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `5.3.0` · App version: `3.3.2`
