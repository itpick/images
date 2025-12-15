# flink

Apache Flink is an open source stream processing framework with powerful stream- and batch-processing capabilities

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flink

# Load into Docker
nix build .#load-flink-to-docker && ./result/bin/load-flink-to-docker
```
