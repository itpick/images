# heartbeat

Heartbeat periodically checks the status of your services and determine whether they are available

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#heartbeat

# Load into Docker
nix build .#load-heartbeat-to-docker && ./result/bin/load-heartbeat-to-docker
```
