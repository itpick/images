# filebeat-fips

filebeat Tails and ships log files

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#filebeat-fips

# Load into Docker
nix build .#load-filebeat-fips-to-docker && ./result/bin/load-filebeat-fips-to-docker
```
