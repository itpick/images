# dnsdist-2.0-nodnscrypt

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dnsdist-2.0-nodnscrypt

# Load into Docker
nix build .#load-dnsdist-2.0-nodnscrypt-to-docker && ./result/bin/load-dnsdist-2.0-nodnscrypt-to-docker
```
