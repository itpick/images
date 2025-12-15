# gitlab-rails-scripts-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-rails-scripts-fips

# Load into Docker
nix build .#load-gitlab-rails-scripts-fips-to-docker && ./result/bin/load-gitlab-rails-scripts-fips-to-docker
```
