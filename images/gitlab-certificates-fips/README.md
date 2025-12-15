# gitlab-certificates-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-certificates-fips

# Load into Docker
nix build .#load-gitlab-certificates-fips-to-docker && ./result/bin/load-gitlab-certificates-fips-to-docker
```
