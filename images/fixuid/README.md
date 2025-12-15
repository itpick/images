# fixuid

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fixuid

# Load into Docker
nix build .#load-fixuid-to-docker && ./result/bin/load-fixuid-to-docker
```
