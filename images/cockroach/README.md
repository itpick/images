# cockroach

CockroachDB is a cloud-native distributed SQL database designed to build, scale, and manage modern, data-intensive applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cockroach

# Load into Docker
nix build .#load-cockroach-to-docker && ./result/bin/load-cockroach-to-docker
```
