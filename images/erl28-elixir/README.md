# erl28-elixir

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#erl28-elixir

# Load into Docker
nix build .#load-erl28-elixir-to-docker && ./result/bin/load-erl28-elixir-to-docker
```
