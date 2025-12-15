# vitess-lite

Vitess is a database clustering system for horizontal scaling of MySQL through generalized sharding

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vitess-lite

# Load into Docker
nix build .#load-vitess-lite-to-docker && ./result/bin/load-vitess-lite-to-docker
```
