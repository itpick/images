# loki-helm-test

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#loki-helm-test

# Load into Docker
nix build .#load-loki-helm-test-to-docker && ./result/bin/load-loki-helm-test-to-docker
```
