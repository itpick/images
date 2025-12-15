# hubble-relay

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#hubble-relay

# Load into Docker
nix build .#load-hubble-relay-to-docker && ./result/bin/load-hubble-relay-to-docker
```
