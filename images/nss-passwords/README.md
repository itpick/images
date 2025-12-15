# nss-passwords

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nss-passwords

# Load into Docker
nix build .#load-nss-passwords-to-docker && ./result/bin/load-nss-passwords-to-docker
```
