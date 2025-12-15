# crossplane-provider-gitlab-fips

This image contains the Crossplane GitLab provider, which allows you to manage GitLab resources using Crossplane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-gitlab-fips

# Load into Docker
nix build .#load-crossplane-provider-gitlab-fips-to-docker && ./result/bin/load-crossplane-provider-gitlab-fips-to-docker
```
