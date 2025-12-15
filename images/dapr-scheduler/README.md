# dapr-scheduler

Dapr is a portable, event-driven, runtime for building distributed applications across cloud and edge

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dapr-scheduler

# Load into Docker
nix build .#load-dapr-scheduler-to-docker && ./result/bin/load-dapr-scheduler-to-docker
```
