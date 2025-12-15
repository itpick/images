# java-cacerts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#java-cacerts

# Load into Docker
nix build .#load-java-cacerts-to-docker && ./result/bin/load-java-cacerts-to-docker
```
