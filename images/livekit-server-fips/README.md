# livekit-server-fips

livekit-server is an open-source media server for real-time audio, video, and data, designed for low latency and scalability

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#livekit-server-fips

# Load into Docker
nix build .#load-livekit-server-fips-to-docker && ./result/bin/load-livekit-server-fips-to-docker
```
