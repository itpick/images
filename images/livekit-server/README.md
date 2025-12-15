# livekit-server

livekit-server is an open-source media server for real-time audio, video, and data, designed for low latency and scalability

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#livekit-server

# Load into Docker
nix build .#load-livekit-server-to-docker && ./result/bin/load-livekit-server-to-docker
```
