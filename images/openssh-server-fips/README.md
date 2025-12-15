# openssh-server-fips

OpenSSH Server FIPS is a secure shell (SSH) server implementation that provides encrypted communication between clients and servers, with FIPS compliance

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssh-server-fips

# Load into Docker
nix build .#load-openssh-server-fips-to-docker && ./result/bin/load-openssh-server-fips-to-docker
```
