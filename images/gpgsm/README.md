# gpgsm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gpgsm

# Load into Docker
nix build .#load-gpgsm-to-docker && ./result/bin/load-gpgsm-to-docker
```
