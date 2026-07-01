# airflow-nixchart

Apache Airflow is a platform to programmatically author, schedule, and monitor workflows as directed acyclic graphs (DAGs)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#airflow-nixchart

# Load into Docker
nix build .#load-airflow-nixchart-to-docker && ./result/bin/load-airflow-nixchart-to-docker
```
