# spire-agent

Minimalist Wolfi-based spire images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#spire-agent

# Load into Docker
nix build .#load-spire-agent-to-docker && ./result/bin/load-spire-agent-to-docker
```
