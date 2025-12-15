# linkerd-cni-plugin

Init container that sets up the iptables rules to forward traffic into the Linkerd2 sidecar proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#linkerd-cni-plugin

# Load into Docker
nix build .#load-linkerd-cni-plugin-to-docker && ./result/bin/load-linkerd-cni-plugin-to-docker
```
