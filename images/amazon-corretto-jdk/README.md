# amazon-corretto-jdk

Amazon Corretto is a no-cost, multi-platform, production-ready distribution of corresponding version of OpenJDK

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-corretto-jdk

# Load into Docker
nix build .#load-amazon-corretto-jdk-to-docker && ./result/bin/load-amazon-corretto-jdk-to-docker
```
