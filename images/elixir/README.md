# elixir

Elixir is a dynamic, functional language for building scalable and maintainable applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#elixir

# Load into Docker
nix build .#load-elixir-to-docker && ./result/bin/load-elixir-to-docker
```
