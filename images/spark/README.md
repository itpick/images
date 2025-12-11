# spark

Spark provides high-level APIs in Scala, Java, Python, and R, and an optimized engine that supports general computation graphs for data analysis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 44s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#spark

# Load into Docker
nix build .#load-spark-to-docker && ./result/bin/load-spark-to-docker
```
