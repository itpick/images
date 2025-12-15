# unbound

Unbound is a validating, recursive, and caching DNS resolver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#unbound

# Load into Docker
nix build .#load-unbound-to-docker && ./result/bin/load-unbound-to-docker
```
