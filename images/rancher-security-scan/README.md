# rancher-security-scan

Evaluates Kubernetes cluster security posture against established best practices using kube-bench framework

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-security-scan

# Load into Docker
nix build .#load-rancher-security-scan-to-docker && ./result/bin/load-rancher-security-scan-to-docker
```
