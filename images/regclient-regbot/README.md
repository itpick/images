# regclient-regbot

regclient is a client interface to OCI conformant registries and content shipped with the OCI Image Layout

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#regclient-regbot

# Load into Docker
nix build .#load-regclient-regbot-to-docker && ./result/bin/load-regclient-regbot-to-docker
```
