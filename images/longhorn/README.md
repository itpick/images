# longhorn

Cloud-native distributed block storage for Kubernetes — manager controller.
Longhorn turns Kubernetes worker nodes into a replicated, distributed block
storage system with support for snapshots, backups, and disaster recovery.

## Multi-image project

Longhorn deploys as a set of cooperating images. This directory wraps the
**manager** only. The full image set for a Longhorn deployment is:

| Component | Image |
|---|---|
| Manager (this image) | `longhornio/longhorn-manager` |
| Engine | `longhornio/longhorn-engine` |
| Instance Manager | `longhornio/longhorn-instance-manager` |
| Share Manager | `longhornio/longhorn-share-manager` |
| UI | `longhornio/longhorn-ui` |

Use the official Longhorn Helm chart or manifests to deploy the full stack.

## Build strategy

This image uses `nix2container.pullImage` to reuse the upstream Docker image
(`longhornio/longhorn-manager`) and re-wrap it with standard labels.
The `sha256` field is a placeholder — the first `nix build` will fail with the
correct hash; update `default.nix` and re-run.

## Source

- Upstream: https://github.com/longhorn/longhorn
- Docker Hub: https://hub.docker.com/r/longhornio/longhorn-manager

## Build

```
nix build .#longhorn
```
