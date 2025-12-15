# neuvector-monitor

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#neuvector-monitor

# Load into Docker
nix build .#load-neuvector-monitor-to-docker && ./result/bin/load-neuvector-monitor-to-docker
```
