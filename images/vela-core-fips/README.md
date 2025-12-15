# vela-core-fips

KubeVela is a modern software delivery platform that makes deploying and operating applications across today's hybrid, multi-cloud environments easier, faster and more reliable

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vela-core-fips

# Load into Docker
nix build .#load-vela-core-fips-to-docker && ./result/bin/load-vela-core-fips-to-docker
```
