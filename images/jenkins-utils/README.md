# jenkins-utils

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jenkins-utils

# Load into Docker
nix build .#load-jenkins-utils-to-docker && ./result/bin/load-jenkins-utils-to-docker
```
