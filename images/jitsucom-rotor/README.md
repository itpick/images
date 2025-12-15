# jitsucom-rotor

Jitsu is an open-source Segment alternative. Fully-scriptable data ingestion engine for modern data teams. Set-up a real-time data pipeline in minutes, not days

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jitsucom-rotor

# Load into Docker
nix build .#load-jitsucom-rotor-to-docker && ./result/bin/load-jitsucom-rotor-to-docker
```
