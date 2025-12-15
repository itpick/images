# auditbeat-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#auditbeat-fips

# Load into Docker
nix build .#load-auditbeat-fips-to-docker && ./result/bin/load-auditbeat-fips-to-docker
```
