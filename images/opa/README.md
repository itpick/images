# opa

Open Policy Agent (OPA) is an open source, general-purpose policy engine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#opa

# Load into Docker
nix build .#load-opa-to-docker && ./result/bin/load-opa-to-docker
```
