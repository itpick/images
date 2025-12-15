# erl27-elixir

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#erl27-elixir

# Load into Docker
nix build .#load-erl27-elixir-to-docker && ./result/bin/load-erl27-elixir-to-docker
```
