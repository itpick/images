# gitlab-rails-ce-assets-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-rails-ce-assets-fips

# Load into Docker
nix build .#load-gitlab-rails-ce-assets-fips-to-docker && ./result/bin/load-gitlab-rails-ce-assets-fips-to-docker
```
