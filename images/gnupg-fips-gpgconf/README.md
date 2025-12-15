# gnupg-fips-gpgconf

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gnupg-fips-gpgconf

# Load into Docker
nix build .#load-gnupg-fips-gpgconf-to-docker && ./result/bin/load-gnupg-fips-gpgconf-to-docker
```
