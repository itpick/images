# azure-functions-node

Azure Functions is a managed platform-as-a-service provider which offers scalable and serverless hosting for code projects. It extends the Azure platform with the capability to implement code triggered by many events occurring in Azure, on-premises or other 3rd party service

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-functions-node

# Load into Docker
nix build .#load-azure-functions-node-to-docker && ./result/bin/load-azure-functions-node-to-docker
```
