# adoptium-jdk

Minimal Wolfi-based Adoptium Java JDK image using Adoptium OpenJDK. Used for compiling Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#adoptium-jdk

# Load into Docker
nix build .#load-adoptium-jdk-to-docker && ./result/bin/load-adoptium-jdk-to-docker
```
