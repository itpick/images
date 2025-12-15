# spamcheck

Spamcheck is a gRPC-based spam classification service for GitLab

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spamcheck

# Load into Docker
nix build .#load-spamcheck-to-docker && ./result/bin/load-spamcheck-to-docker
```
