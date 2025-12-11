# gitlab-sidekiq

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#gitlab-sidekiq

# Load into Docker
nix build .#load-gitlab-sidekiq-to-docker && ./result/bin/load-gitlab-sidekiq-to-docker
```
