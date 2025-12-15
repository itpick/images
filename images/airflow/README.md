# airflow

A minimal, wolfi-based image for Apache Airflow.Apache Airflow is a platform to programmatically author, schedule, and monitor workflows

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#airflow

# Load into Docker
nix build .#load-airflow-to-docker && ./result/bin/load-airflow-to-docker
```
