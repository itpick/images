# aws-cli

Minimal aws-cli container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#aws-cli

# Load into Docker
nix build .#load-aws-cli-to-docker && ./result/bin/load-aws-cli-to-docker
```
