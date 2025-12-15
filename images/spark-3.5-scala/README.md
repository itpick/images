# spark-3.5-scala

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spark-3.5-scala

# Load into Docker
nix build .#load-spark-3.5-scala-to-docker && ./result/bin/load-spark-3.5-scala-to-docker
```
