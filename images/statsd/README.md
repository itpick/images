# statsd

Daemon for easy but powerful stats aggregation

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#statsd

# Load into Docker
nix build .#load-statsd-to-docker && ./result/bin/load-statsd-to-docker
```
