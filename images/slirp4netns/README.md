# slirp4netns

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#slirp4netns

# Load into Docker
nix build .#load-slirp4netns-to-docker && ./result/bin/load-slirp4netns-to-docker
```
