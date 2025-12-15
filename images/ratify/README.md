# ratify

Artifact Ratification Framework (CNCF Sandbox)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify

# Load into Docker
nix build .#load-ratify-to-docker && ./result/bin/load-ratify-to-docker
```
