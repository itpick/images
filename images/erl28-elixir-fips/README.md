# erl28-elixir-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#erl28-elixir-fips

# Load into Docker
nix build .#load-erl28-elixir-fips-to-docker && ./result/bin/load-erl28-elixir-fips-to-docker
```
