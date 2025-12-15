# azure-workload-identity-webhook

A webhook for Kubernetes that enables Azure Active Directory based authentication from Kubernetes workloads to Azure resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-workload-identity-webhook

# Load into Docker
nix build .#load-azure-workload-identity-webhook-to-docker && ./result/bin/load-azure-workload-identity-webhook-to-docker
```
