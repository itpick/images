# ntia-conformance-checker

Check SPDX SBOM for NTIA minimum elements

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ntia-conformance-checker

# Load into Docker
nix build .#load-ntia-conformance-checker-to-docker && ./result/bin/load-ntia-conformance-checker-to-docker
```
