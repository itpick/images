# policy-bot

A GitHub App that enforces approval policies on pull requests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#policy-bot

# Load into Docker
nix build .#load-policy-bot-to-docker && ./result/bin/load-policy-bot-to-docker
```
