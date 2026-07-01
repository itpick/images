# rabbitmq

Helm chart for **rabbitmq** — RabbitMQ is an open source general-purpose message broker that is designed for consistent, highly-available messaging scenarios (both synchronous and asynchronous).

[Upstream project](https://www.rabbitmq.com)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/rabbitmq
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/rabbitmq --version 16.0.16
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

- [`os-shell-nixchart`](../../images/os-shell-nixchart/)
- [`rabbitmq-nixchart`](../../images/rabbitmq-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/rabbitmq>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `16.0.16` · App version: `4.1.3`
