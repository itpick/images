# spark-operator

A minimal, Wolfi-based image for Spark Operator. Facilitates the deployment and management of Apache Spark applications in Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#spark-operator

# Load into Docker
nix build .#load-spark-operator-to-docker && ./result/bin/load-spark-operator-to-docker
```
