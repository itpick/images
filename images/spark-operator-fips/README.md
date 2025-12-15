# spark-operator-fips

A minimal, FIPS 140-3 compliant image for Spark Operator. Facilitates the deployment and management of Apache Spark applications in Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spark-operator-fips

# Load into Docker
nix build .#load-spark-operator-fips-to-docker && ./result/bin/load-spark-operator-fips-to-docker
```
