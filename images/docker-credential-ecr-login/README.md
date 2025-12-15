# docker-credential-ecr-login

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docker-credential-ecr-login

# Load into Docker
nix build .#load-docker-credential-ecr-login-to-docker && ./result/bin/load-docker-credential-ecr-login-to-docker
```
