# neuvector-cis-benchmarks

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-cis-benchmarks

# Load into Docker
nix build .#load-neuvector-cis-benchmarks-to-docker && ./result/bin/load-neuvector-cis-benchmarks-to-docker
```
