# gitlab-workhorse

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#gitlab-workhorse

# Load into Docker
nix build .#load-gitlab-workhorse-to-docker && ./result/bin/load-gitlab-workhorse-to-docker
```
