# gitlab-runner-helper-oci-entrypoint-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-runner-helper-oci-entrypoint-fips

# Load into Docker
nix build .#load-gitlab-runner-helper-oci-entrypoint-fips-to-docker && ./result/bin/load-gitlab-runner-helper-oci-entrypoint-fips-to-docker
```
