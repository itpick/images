# wiremock

Wiremock is a tool for mocking HTTP services

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#wiremock

# Load into Docker
nix build .#load-wiremock-to-docker && ./result/bin/load-wiremock-to-docker
```
