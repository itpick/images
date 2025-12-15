# spdx-tools-java

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spdx-tools-java

# Load into Docker
nix build .#load-spdx-tools-java-to-docker && ./result/bin/load-spdx-tools-java-to-docker
```
