# logstash

Helm chart for **logstash** — Logstash is an open source data processing engine. It ingests data from multiple sources, processes it, and sends the output to final destination in real-time. It is a core component of the ELK stack.

[Upstream project](https://www.elastic.co/logstash)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/logstash
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/logstash --version 7.0.12
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

- [`logstash-nixchart`](../../images/logstash-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/logstash>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `7.0.12` · App version: `9.1.2`
