# barman-cloudnative-pg

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#barman-cloudnative-pg

# Load into Docker
nix build .#load-barman-cloudnative-pg-to-docker && ./result/bin/load-barman-cloudnative-pg-to-docker
```
