# erl27-rebar3

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#erl27-rebar3

# Load into Docker
nix build .#load-erl27-rebar3-to-docker && ./result/bin/load-erl27-rebar3-to-docker
```
