# gitlab-rails-ce-assets

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-rails-ce-assets

# Load into Docker
nix build .#load-gitlab-rails-ce-assets-to-docker && ./result/bin/load-gitlab-rails-ce-assets-to-docker
```
