# verticadb-operator

The VerticaDB operator automates tasks and monitors the state of your Vertica on Kubernetes deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#verticadb-operator

# Load into Docker
nix build .#load-verticadb-operator-to-docker && ./result/bin/load-verticadb-operator-to-docker
```
