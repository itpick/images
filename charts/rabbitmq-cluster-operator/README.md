# rabbitmq-cluster-operator

Helm chart for **rabbitmq-cluster-operator** — The RabbitMQ Cluster Kubernetes Operator automates provisioning, management, and operations of RabbitMQ clusters running on Kubernetes.

[Upstream project](https://www.rabbitmq.com/kubernetes/operator/operator-overview.html)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/rabbitmq-cluster-operator
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/rabbitmq-cluster-operator --version 4.4.40
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

- [`rabbitmq-cluster-operator-nixchart`](../../images/rabbitmq-cluster-operator-nixchart/)
- [`rabbitmq-default-user-credential-updater-nixchart`](../../images/rabbitmq-default-user-credential-updater-nixchart/)
- [`rabbitmq-messaging-topology-operator-nixchart`](../../images/rabbitmq-messaging-topology-operator-nixchart/)
- [`rabbitmq-nixchart`](../../images/rabbitmq-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/rabbitmq-cluster-operator>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `4.4.40` · App version: `2.16.1`
