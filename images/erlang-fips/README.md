# erlang-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#erlang-fips

# Load into Docker
nix build .#load-erlang-fips-to-docker && ./result/bin/load-erlang-fips-to-docker
```
