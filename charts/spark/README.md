# spark

Helm chart for **spark** — Apache Spark is a high-performance engine for large-scale computing tasks, such as data processing, machine learning and real-time data streaming. It includes APIs for Java, Python, Scala and R.

[Upstream project](https://spark.apache.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/spark
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/spark --version 10.0.4
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

- [`spark-nixchart`](../../images/spark-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/spark>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `10.0.4` · App version: `4.0.0`
