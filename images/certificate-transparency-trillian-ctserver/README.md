# certificate-transparency-trillian-ctserver

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#certificate-transparency-trillian-ctserver

# Load into Docker
nix build .#load-certificate-transparency-trillian-ctserver-to-docker && ./result/bin/load-certificate-transparency-trillian-ctserver-to-docker
```
