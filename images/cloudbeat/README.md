# cloudbeat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloudbeat

# Load into Docker
nix build .#load-cloudbeat-to-docker && ./result/bin/load-cloudbeat-to-docker
```
