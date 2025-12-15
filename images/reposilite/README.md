# reposilite

Lightweight and easy-to-use repository management software dedicated for the Maven-based artifacts in the JVM ecosystem

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#reposilite

# Load into Docker
nix build .#load-reposilite-to-docker && ./result/bin/load-reposilite-to-docker
```
