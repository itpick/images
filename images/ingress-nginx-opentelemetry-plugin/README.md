# ingress-nginx-opentelemetry-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ingress-nginx-opentelemetry-plugin

# Load into Docker
nix build .#load-ingress-nginx-opentelemetry-plugin-to-docker && ./result/bin/load-ingress-nginx-opentelemetry-plugin-to-docker
```
