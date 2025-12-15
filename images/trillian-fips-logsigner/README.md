# trillian-fips-logsigner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#trillian-fips-logsigner

# Load into Docker
nix build .#load-trillian-fips-logsigner-to-docker && ./result/bin/load-trillian-fips-logsigner-to-docker
```
