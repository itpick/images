# jitsucom-bulker-ingest

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jitsucom-bulker-ingest

# Load into Docker
nix build .#load-jitsucom-bulker-ingest-to-docker && ./result/bin/load-jitsucom-bulker-ingest-to-docker
```
