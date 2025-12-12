# filebeat

filebeat Tails and ships log files

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 448.27 MB |
| Uncompressed | ~1.09 GB |

## Usage

```bash
# Build the image
nix build .#filebeat

# Load into Docker
nix build .#load-filebeat-to-docker && ./result/bin/load-filebeat-to-docker
```
