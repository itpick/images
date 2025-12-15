# gitlab-workhorse-scripts-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-workhorse-scripts-fips

# Load into Docker
nix build .#load-gitlab-workhorse-scripts-fips-to-docker && ./result/bin/load-gitlab-workhorse-scripts-fips-to-docker
```
