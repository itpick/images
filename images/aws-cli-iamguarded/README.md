# aws-cli-iamguarded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-cli-iamguarded

# Load into Docker
nix build .#load-aws-cli-iamguarded-to-docker && ./result/bin/load-aws-cli-iamguarded-to-docker
```
