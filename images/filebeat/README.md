# filebeat

filebeat Tails and ships log files

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#filebeat

# Load into Docker
nix build .#load-filebeat-to-docker && ./result/bin/load-filebeat-to-docker
```
