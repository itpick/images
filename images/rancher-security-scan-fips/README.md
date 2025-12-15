# rancher-security-scan-fips

Evaluates Kubernetes cluster security posture against established best practices using kube-bench framework

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-security-scan-fips

# Load into Docker
nix build .#load-rancher-security-scan-fips-to-docker && ./result/bin/load-rancher-security-scan-fips-to-docker
```
