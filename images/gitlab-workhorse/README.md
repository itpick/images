# gitlab-workhorse

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 662.40 MB |
| Uncompressed | ~1.61 GB |

## Usage

```bash
# Build the image
nix build .#gitlab-workhorse

# Load into Docker
nix build .#load-gitlab-workhorse-to-docker && ./result/bin/load-gitlab-workhorse-to-docker
```
