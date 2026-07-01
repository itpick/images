# spark-nixchart

Apache Spark, is a multi-language engine for executing data engineering, data science, and machine learning on single-node machines or clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spark-nixchart

# Load into Docker
nix build .#load-spark-nixchart-to-docker && ./result/bin/load-spark-nixchart-to-docker
```
