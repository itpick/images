# wget

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wget

# Load into Docker
nix build .#load-wget-to-docker && ./result/bin/load-wget-to-docker
```
