# cyberark-secrets-provider-for-k8s

The CyberArk Secrets Provider for Kubernetes provides Kubernetes-based applications with access to secrets that are stored and managed in Conjur

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cyberark-secrets-provider-for-k8s

# Load into Docker
nix build .#load-cyberark-secrets-provider-for-k8s-to-docker && ./result/bin/load-cyberark-secrets-provider-for-k8s-to-docker
```
