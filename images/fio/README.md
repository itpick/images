# fio

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fio

# Load into Docker
nix build .#load-fio-to-docker && ./result/bin/load-fio-to-docker
```
