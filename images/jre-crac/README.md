# jre-crac

Minimalist Wolfi-based OpenJDK JRE image with CRaC support. Used for running Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jre-crac

# Load into Docker
nix build .#load-jre-crac-to-docker && ./result/bin/load-jre-crac-to-docker
```
