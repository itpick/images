# rancher-webhook-fips

Rancher Webhook automates tasks and integrates external systems in response to events within a Rancher-managed Kubernetes environment

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rancher-webhook-fips

# Load into Docker
nix build .#load-rancher-webhook-fips-to-docker && ./result/bin/load-rancher-webhook-fips-to-docker
```
