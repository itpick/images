# step-cli

step-cli is an easy-to-use CLI tool for building, operating, and automating Public Key Infrastructure (PKI) systems and workflows

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#step-cli

# Load into Docker
nix build .#load-step-cli-to-docker && ./result/bin/load-step-cli-to-docker
```
