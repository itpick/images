# airflow-iamguarded

Apache Airflow is a platform to programmatically author, schedule, and monitor workflows as directed acyclic graphs (DAGs)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#airflow-iamguarded

# Load into Docker
nix build .#load-airflow-iamguarded-to-docker && ./result/bin/load-airflow-iamguarded-to-docker
```
