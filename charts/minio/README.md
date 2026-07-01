# minio

Helm chart for **minio** — MinIO is an object storage server, compatible with Amazon S3 cloud storage service, mainly used for storing unstructured data (such as photos, videos, log files, etc.).

[Upstream project](https://min.io)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/minio
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/minio --version 17.0.23
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

- [`minio-client-nixchart`](../../images/minio-client-nixchart/)
- [`minio-nixchart`](../../images/minio-nixchart/)
- [`minio-object-browser-nixchart`](../../images/minio-object-browser-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/minio>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `17.0.23` · App version: `2025.7.23`
