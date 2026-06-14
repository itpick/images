# Specifications: longhorn

- **Base:** upstream `longhornio/longhorn-manager:v1.10.0` (re-wrapped via nix2container.pullImage)
- **Entrypoint:** inherited from upstream
- **User:** inherited from upstream
- **Ports:** 9500/tcp (manager API), 9501/tcp (manager metrics)
- **Persistent dirs:** node-local storage managed by Longhorn on worker nodes; not a container volume
- **Required env:** see upstream docs; typically configured via Kubernetes manifests/Helm
- **Note:** Manager-only image; full Longhorn stack requires engine, instance-manager, share-manager, and UI images
