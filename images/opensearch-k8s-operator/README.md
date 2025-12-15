# opensearch-k8s-operator

The Kubernetes OpenSearch Operator is used for automating the deployment, provisioning, management, and orchestration of OpenSearch clusters and OpenSearch dashboards

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opensearch-k8s-operator

# Load into Docker
nix build .#load-opensearch-k8s-operator-to-docker && ./result/bin/load-opensearch-k8s-operator-to-docker
```
