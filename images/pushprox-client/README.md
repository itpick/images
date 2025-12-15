# pushprox-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pushprox-client

# Load into Docker
nix build .#load-pushprox-client-to-docker && ./result/bin/load-pushprox-client-to-docker
```
