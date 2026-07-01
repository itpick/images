# Helm Charts

Helm charts maintained by nix-containers.

## Install a chart

Charts are published as OCI artifacts on GHCR. Install directly:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/postgresql
```

To pin a specific chart version:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/postgresql --version 17.1.0
```

To pass values overrides:

```console
helm install my-release oci://ghcr.io/nix-containers/charts/postgresql \
  --set auth.postgresPassword=changeme \
  --set primary.persistence.size=20Gi
```

## Discover available charts

Browse the catalog on the [nix-containers site](https://nix-containers.github.io/images/charts/) or
list every chart directory in this repo:

```console
ls charts/
```

## Layout

- Each subdirectory is one chart (e.g. `charts/postgresql/`).
- Charts default their `image.repository` to a matching `-nixchart` image
  from this repo's registry (e.g. `ghcr.io/nix-containers/postgres-nixchart`).
- Each chart is self-contained — helper templates are inlined into each
  chart's `templates/` directory, no shared library subchart.

## Naming — why `-nixchart`?

Container images that pair with a chart in this directory carry the
`-nixchart` suffix (e.g. `postgres-nixchart` pairs with `charts/postgresql`).
When you see a `Chart.yaml` here referencing `postgres-nixchart`, it means
this is the image variant that is built + tested against this chart.

## Not in this directory

Images that pair with a project-official upstream chart (Flux,
cert-manager, ingress-nginx, prometheus-operator) don't have charts
here. Use the upstream chart with our `-fips` or plain image; the
per-image page on the website links to the appropriate upstream chart.

## Contributing

- Source: <https://github.com/nix-containers/images/tree/main/charts>
- Issues: <https://github.com/nix-containers/images/issues>
- Charts are refactored per-chart; each `charts/<name>/README.md` has
  its own install + config notes.
