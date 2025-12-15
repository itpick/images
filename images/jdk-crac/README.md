# jdk-crac

Minimalist Wolfi-based OpenJDK image with CRaC support. Used for compiling Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jdk-crac

# Load into Docker
nix build .#load-jdk-crac-to-docker && ./result/bin/load-jdk-crac-to-docker
```
