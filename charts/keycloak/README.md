# keycloak

Helm chart for **keycloak** — Keycloak is a high performance Java-based identity and access management solution. It lets developers add an authentication layer to their applications with minimum effort.

[Upstream project](https://www.keycloak.org)

## Install

```console
helm install my-release oci://ghcr.io/nix-containers/charts/keycloak
```

To pin an app version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/keycloak --version 25.4.0
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

- [`keycloak-config-cli-nixchart`](../../images/keycloak-config-cli-nixchart/)
- [`keycloak-nixchart`](../../images/keycloak-nixchart/)

## Source and issues

- Chart source: <https://github.com/nix-containers/images/tree/main/charts/keycloak>
- Report issues: <https://github.com/nix-containers/images/issues>
- Chart version: `25.4.0` · App version: `26.3.3`
