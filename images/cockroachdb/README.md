# cockroachdb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 13s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cockroachdb

# Load into Docker
nix build .#load-cockroachdb-to-docker && ./result/bin/load-cockroachdb-to-docker
```
