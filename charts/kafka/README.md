# kafka

Helm chart for **kafka** — Apache Kafka is a distributed streaming platform designed to build real-time pipelines and can be used as a message broker or as a replacement for a log aggregation solution for big data applications.

[Upstream project](https://kafka.apache.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kafka
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kafka --version 32.4.4
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

- [`jmx-exporter-nixchart`](../../images/jmx-exporter-nixchart/)
- [`kafka-nixchart`](../../images/kafka-nixchart/)
- [`kubectl-nixchart`](../../images/kubectl-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/kafka>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `32.4.4` · App version: `4.0.0`
