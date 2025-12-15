# ksops

KSOPS, or kustomize-SOPS, is a kustomize KRM exec plugin for SOPS encrypted resources. KSOPS can be used to decrypt any Kubernetes resource, but is most commonly used to decrypt encryptedKubernetes Secrets and ConfigMaps. As a kustomize plugin, KSOPS allows you to manage, build, and apply encrypted manifests the same way you manage the rest of your Kubernetes manifests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ksops

# Load into Docker
nix build .#load-ksops-to-docker && ./result/bin/load-ksops-to-docker
```
