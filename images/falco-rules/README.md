# falco-rules

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#falco-rules

# Load into Docker
nix build .#load-falco-rules-to-docker && ./result/bin/load-falco-rules-to-docker
```
