# sigstore-scaffolding-ctlog-verifyfulcio

Minimal Wolfi-based Sigstore images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-ctlog-verifyfulcio

# Load into Docker
nix build .#load-sigstore-scaffolding-ctlog-verifyfulcio-to-docker && ./result/bin/load-sigstore-scaffolding-ctlog-verifyfulcio-to-docker
```
