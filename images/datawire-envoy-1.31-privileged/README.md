# datawire-envoy-1.31-privileged

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datawire-envoy-1.31-privileged

# Load into Docker
nix build .#load-datawire-envoy-1.31-privileged-to-docker && ./result/bin/load-datawire-envoy-1.31-privileged-to-docker
```
