# gitaly-git-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitaly-git-fips

# Load into Docker
nix build .#load-gitaly-git-fips-to-docker && ./result/bin/load-gitaly-git-fips-to-docker
```
