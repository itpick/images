# benthos

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#benthos

# Load into Docker
nix build .#load-benthos-to-docker && ./result/bin/load-benthos-to-docker
```
