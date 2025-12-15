# tekton-resolvers-fips

Tekton provides a cloud-native Pipeline resource, mainly intended for CI/CD use cases

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-resolvers-fips

# Load into Docker
nix build .#load-tekton-resolvers-fips-to-docker && ./result/bin/load-tekton-resolvers-fips-to-docker
```
