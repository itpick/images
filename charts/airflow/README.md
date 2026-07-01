# airflow

Helm chart for **airflow** — Apache Airflow is a tool to express and execute workflows as directed acyclic graphs (DAGs). It includes utilities to schedule tasks, monitor task progress and handle task dependencies.

[Upstream project](https://airflow.apache.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/airflow
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/airflow --version 25.1.0
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

- [`airflow-nixchart`](../../images/airflow-nixchart/)
- [`prometheus-statsd-exporter-nixchart`](../../images/prometheus-statsd-exporter-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/airflow>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `25.1.0` · App version: `3.0.5`
