# jdk

Minimal Wolfi-based Java JDK image using OpenJDK. Used for compiling Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#jdk

# Load into Docker
nix build .#load-jdk-to-docker && ./result/bin/load-jdk-to-docker
```
