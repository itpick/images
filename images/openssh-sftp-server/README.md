# openssh-sftp-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssh-sftp-server

# Load into Docker
nix build .#load-openssh-sftp-server-to-docker && ./result/bin/load-openssh-sftp-server-to-docker
```
