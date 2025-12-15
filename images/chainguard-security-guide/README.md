# chainguard-security-guide

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chainguard-security-guide

# Load into Docker
nix build .#load-chainguard-security-guide-to-docker && ./result/bin/load-chainguard-security-guide-to-docker
```
