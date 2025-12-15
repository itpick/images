# openssh-server

OpenSSH Server is a secure shell (SSH) server implementation that provides encrypted communication between clients and servers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssh-server

# Load into Docker
nix build .#load-openssh-server-to-docker && ./result/bin/load-openssh-server-to-docker
```
