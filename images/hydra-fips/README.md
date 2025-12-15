# hydra-fips

Ory Hydra is a hardened, OpenID Certified OAuth 2.0 Server and OpenID Connect Provider optimized for low-latency, high throughput, and low resource consumption

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hydra-fips

# Load into Docker
nix build .#load-hydra-fips-to-docker && ./result/bin/load-hydra-fips-to-docker
```
