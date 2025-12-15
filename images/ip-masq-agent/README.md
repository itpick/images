# ip-masq-agent

Minimal image to manage IP masquerading on Kubernetes nodes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ip-masq-agent

# Load into Docker
nix build .#load-ip-masq-agent-to-docker && ./result/bin/load-ip-masq-agent-to-docker
```
