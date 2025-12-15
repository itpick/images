# spark-fips

Spark provides high-level APIs in Scala, Java, Python, and R, and an optimized engine that supports general computation graphs for data analysis

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spark-fips

# Load into Docker
nix build .#load-spark-fips-to-docker && ./result/bin/load-spark-fips-to-docker
```
