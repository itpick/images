# azure-service-operator

Instead of deploying and managing your Azure resources separately from your Kubernetes application, ASO allows you to manage them together, automatically configuring your application as needed. For example, ASO can set up your Redis Cache or PostgreSQL database server and then configure your Kubernetes application to use them

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-service-operator

# Load into Docker
nix build .#load-azure-service-operator-to-docker && ./result/bin/load-azure-service-operator-to-docker
```
