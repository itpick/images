# kyverno-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#kyverno-plugin

# Load into Docker
nix build .#load-kyverno-plugin-to-docker && ./result/bin/load-kyverno-plugin-to-docker
```
