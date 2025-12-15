# conftest-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#conftest-fips

# Load into Docker
nix build .#load-conftest-fips-to-docker && ./result/bin/load-conftest-fips-to-docker
```
