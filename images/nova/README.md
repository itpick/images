# nova

Nova is a cli tool to find outdated or deprecated Helm charts running in your Kubernetes cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nova

# Load into Docker
nix build .#load-nova-to-docker && ./result/bin/load-nova-to-docker
```
