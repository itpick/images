# knative-eventing-1.19-channel-dispatcher

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-1.19-channel-dispatcher

# Load into Docker
nix build .#load-knative-eventing-1.19-channel-dispatcher-to-docker && ./result/bin/load-knative-eventing-1.19-channel-dispatcher-to-docker
```
