# Specifications: rook

- **Base:** upstream `rook/ceph:v1.18.5` (re-wrapped via nix2container.pullImage)
- **Entrypoint:** inherited from upstream
- **User:** inherited from upstream
- **Ports:** none exposed by default (operator communicates via Kubernetes API)
- **Persistent dirs:** none required for the operator itself; Ceph data is on node storage
- **Required env:** configured via Kubernetes CephCluster CRD and operator Helm values
- **Note:** Operator-only image; running Ceph also requires `ceph/ceph` cluster images
