# kserve-agent

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-agent

# Load into Docker
nix build .#load-kserve-agent-to-docker && ./result/bin/load-kserve-agent-to-docker
```
