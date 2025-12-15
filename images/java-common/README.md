# java-common

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#java-common

# Load into Docker
nix build .#load-java-common-to-docker && ./result/bin/load-java-common-to-docker
```
