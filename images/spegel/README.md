# spegel

Stateless cluster local OCI registry mirror

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 56s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#spegel

# Load into Docker
nix build .#load-spegel-to-docker && ./result/bin/load-spegel-to-docker
```
