# atmoz-sftp-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#atmoz-sftp-fips

# Load into Docker
nix build .#load-atmoz-sftp-fips-to-docker && ./result/bin/load-atmoz-sftp-fips-to-docker
```
