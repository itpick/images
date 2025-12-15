# timestamp-authority-server

timestamp-authority is an RFC3161 Timestamp Authority, a core component of the sigstore stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#timestamp-authority-server

# Load into Docker
nix build .#load-timestamp-authority-server-to-docker && ./result/bin/load-timestamp-authority-server-to-docker
```
