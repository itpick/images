# docker-credential-ecr-login-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-credential-ecr-login-fips

# Load into Docker
nix build .#load-docker-credential-ecr-login-fips-to-docker && ./result/bin/load-docker-credential-ecr-login-fips-to-docker
```
