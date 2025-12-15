# volsync-fips-diskrsync-tcp

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#volsync-fips-diskrsync-tcp

# Load into Docker
nix build .#load-volsync-fips-diskrsync-tcp-to-docker && ./result/bin/load-volsync-fips-diskrsync-tcp-to-docker
```
