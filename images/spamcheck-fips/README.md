# spamcheck-fips

Spamcheck is a gRPC-based spam classification service for GitLab

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spamcheck-fips

# Load into Docker
nix build .#load-spamcheck-fips-to-docker && ./result/bin/load-spamcheck-fips-to-docker
```
