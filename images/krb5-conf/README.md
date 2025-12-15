# krb5-conf

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#krb5-conf

# Load into Docker
nix build .#load-krb5-conf-to-docker && ./result/bin/load-krb5-conf-to-docker
```
