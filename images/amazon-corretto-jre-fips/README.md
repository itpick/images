# amazon-corretto-jre-fips

Amazon Corretto is a no-cost, multi-platform, production-ready distribution of corresponding version of OpenJDK

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-corretto-jre-fips

# Load into Docker
nix build .#load-amazon-corretto-jre-fips-to-docker && ./result/bin/load-amazon-corretto-jre-fips-to-docker
```
