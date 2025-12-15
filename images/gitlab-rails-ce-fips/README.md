# gitlab-rails-ce-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-rails-ce-fips

# Load into Docker
nix build .#load-gitlab-rails-ce-fips-to-docker && ./result/bin/load-gitlab-rails-ce-fips-to-docker
```
