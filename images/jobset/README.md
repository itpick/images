# jobset

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#jobset

# Load into Docker
nix build .#load-jobset-to-docker && ./result/bin/load-jobset-to-docker
```
