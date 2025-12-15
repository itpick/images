# gitlab-logger-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-logger-fips

# Load into Docker
nix build .#load-gitlab-logger-fips-to-docker && ./result/bin/load-gitlab-logger-fips-to-docker
```
