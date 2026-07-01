# kibana

Helm chart for **kibana** — Kibana is an open source, browser based analytics and search dashboard for Elasticsearch. Kibana strives to be easy to get started with, while also being flexible and powerful.

[Upstream project](https://www.elastic.co/kibana)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kibana
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/kibana --version 12.1.11
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

- [`kibana-nixchart`](../../images/kibana-nixchart/)
- [`os-shell-nixchart`](../../images/os-shell-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/kibana>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `12.1.11` · App version: `9.1.2`
