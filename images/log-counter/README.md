# log-counter

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#log-counter

# Load into Docker
nix build .#load-log-counter-to-docker && ./result/bin/load-log-counter-to-docker
```
