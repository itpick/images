# trillian-logserver

Trillian is a Merkle tree implementation that is used as the backing for various functionalities including Certificate Transparency and the Sigstore Rekor transparency log

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trillian-logserver

# Load into Docker
nix build .#load-trillian-logserver-to-docker && ./result/bin/load-trillian-logserver-to-docker
```
