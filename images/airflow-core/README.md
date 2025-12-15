# airflow-core

Apache Airflow offers a platform to author, schedule, and monitor workflows programmatically. This image is a minimal, slimmed-down version of the official Apache Airflow with only core components

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#airflow-core

# Load into Docker
nix build .#load-airflow-core-to-docker && ./result/bin/load-airflow-core-to-docker
```
