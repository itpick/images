# amazon-corretto-jre

Amazon Corretto is a no-cost, multi-platform, production-ready distribution of corresponding version of OpenJDK

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-corretto-jre

# Load into Docker
nix build .#load-amazon-corretto-jre-to-docker && ./result/bin/load-amazon-corretto-jre-to-docker
```
