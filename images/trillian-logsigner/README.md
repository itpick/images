# trillian-logsigner

Trillian is a Merkle tree implementation that is used as the backing for various functionalities including Certificate Transparency and the Sigstore Rekor transparency log

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trillian-logsigner

# Load into Docker
nix build .#load-trillian-logsigner-to-docker && ./result/bin/load-trillian-logsigner-to-docker
```
