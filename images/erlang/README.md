# erlang

Container image for building Erlang applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#erlang

# Load into Docker
nix build .#load-erlang-to-docker && ./result/bin/load-erlang-to-docker
```
