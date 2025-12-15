# gnupg-fips-wks-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gnupg-fips-wks-client

# Load into Docker
nix build .#load-gnupg-fips-wks-client-to-docker && ./result/bin/load-gnupg-fips-wks-client-to-docker
```
