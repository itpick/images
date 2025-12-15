# unbound-mailcow

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#unbound-mailcow

# Load into Docker
nix build .#load-unbound-mailcow-to-docker && ./result/bin/load-unbound-mailcow-to-docker
```
