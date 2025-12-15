# timestamp-authority

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#timestamp-authority

# Load into Docker
nix build .#load-timestamp-authority-to-docker && ./result/bin/load-timestamp-authority-to-docker
```
