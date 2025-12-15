# kserve-modelmesh

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-modelmesh

# Load into Docker
nix build .#load-kserve-modelmesh-to-docker && ./result/bin/load-kserve-modelmesh-to-docker
```
