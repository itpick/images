# elixir-fips

Container image for building Elixir applications with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#elixir-fips

# Load into Docker
nix build .#load-elixir-fips-to-docker && ./result/bin/load-elixir-fips-to-docker
```
