# rook

Storage operator for Kubernetes — Rook Ceph operator that manages Ceph storage
clusters. Rook automates deployment, bootstrapping, configuration, scaling, and
self-healing of Ceph clusters running in Kubernetes.

## Operator-only image

This image is the **Rook operator** only. Running a complete Ceph cluster also
requires the upstream Ceph cluster images (`ceph/ceph`). The operator watches
CephCluster custom resources and drives Ceph image deployments. Rook does not
re-distribute the Ceph images; they are pulled directly from Docker Hub at
deploy time.

Install via the official Rook Helm chart:
```
helm repo add rook-release https://charts.rook.io/release
helm install rook-ceph rook-release/rook-ceph
```

## Build strategy

This image uses `nix2container.pullImage` to reuse the upstream Docker image
(`rook/ceph`) and re-wrap it with standard labels.
The `sha256` field is a placeholder — the first `nix build` will fail with the
correct hash; update `default.nix` and re-run.

## Source

- Upstream: https://github.com/rook/rook
- Docker Hub: https://hub.docker.com/r/rook/ceph

## Build

```
nix build .#rook
```
