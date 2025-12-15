# erl27-elixir-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#erl27-elixir-fips

# Load into Docker
nix build .#load-erl27-elixir-fips-to-docker && ./result/bin/load-erl27-elixir-fips-to-docker
```
