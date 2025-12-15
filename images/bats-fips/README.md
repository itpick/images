# bats-fips

Bats provides a simple way to verify that the UNIX programs you write behave as expected

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bats-fips

# Load into Docker
nix build .#load-bats-fips-to-docker && ./result/bin/load-bats-fips-to-docker
```
