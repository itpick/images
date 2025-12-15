# jitsucom-console

Jitsu is an open-source Segment alternative. Fully-scriptable data ingestion engine for modern data teams. Set-up a real-time data pipeline in minutes, not days

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jitsucom-console

# Load into Docker
nix build .#load-jitsucom-console-to-docker && ./result/bin/load-jitsucom-console-to-docker
```
