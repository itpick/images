# octo-sts-webhook

A GitHub App that acts like a Security Token Service (STS) for the Github API

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#octo-sts-webhook

# Load into Docker
nix build .#load-octo-sts-webhook-to-docker && ./result/bin/load-octo-sts-webhook-to-docker
```
