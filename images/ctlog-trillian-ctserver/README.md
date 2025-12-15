# ctlog-trillian-ctserver

ctlog is deployed as part of the sigstore stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ctlog-trillian-ctserver

# Load into Docker
nix build .#load-ctlog-trillian-ctserver-to-docker && ./result/bin/load-ctlog-trillian-ctserver-to-docker
```
