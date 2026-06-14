# Specifications: kubectl-dev

- **Base:** nix-built; rootfs = base packages + dev-toolkit + non-root user env
- **Entrypoint:** `/bin/bash`
- **User:** 1000 (non-root, via `nonRoot`)
- **WorkingDir:** `/home/nonroot`
- **Ports:** none exposed
- **Persistent dirs:** none (mount `~/.kube` from host for kubectl config)
- **Required env:** `KUBECONFIG=/home/nonroot/.kube/config` (defaulted; override if needed)
- **Bundled tools:**
  - Kubernetes: `kubectl`, `kustomize`, `helm`
  - Shell: `bash`, `coreutils`, `findutils`, `gnused`, `gnugrep`, `gnutar`, `gzip`, `less`
  - Network/debug: `curl`, `wget`, `dig`, `nslookup`, `ping`, `openssl`, `netcat`
  - Data: `jq`, `yq-go`
  - Secrets: `sops`, `age`
  - Editor: `vim`
