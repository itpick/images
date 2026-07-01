# Helm Charts

Helm charts maintained by nix-containers.

## Layout

- Each subdirectory is one chart (e.g. `charts/postgresql/`).
- Charts default their `image.repository` to a matching `-nixchart` image
  from this repo's registry.
- `common/` is a shared library chart consumed by the others (helpers for
  labels, names, images, security contexts, etc.).

## Naming — why `-nixchart`?

Container images that are shaped for Helm chart consumption (opinionated
entrypoint contracts, non-root defaults, `/opt/*/scripts/`-compatible layout)
carry the `-nixchart` suffix in this repo. When you see a Chart.yaml here that
references `postgresql-nixchart`, it means: this variant of the image is the
one shipped with (and tested against) this chart.

## Not in this directory

Images that pair with a project-official upstream chart (Flux, cert-manager,
ingress-nginx, prometheus-operator) are documented in the per-image
description on the website, with a link to the upstream chart repo. Those
charts stay upstream — we don't fork them here.
