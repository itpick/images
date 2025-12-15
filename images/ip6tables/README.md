# ip6tables

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ip6tables

# Load into Docker
nix build .#load-ip6tables-to-docker && ./result/bin/load-ip6tables-to-docker
```
