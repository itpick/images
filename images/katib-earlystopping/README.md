# katib-earlystopping

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#katib-earlystopping

# Load into Docker
nix build .#load-katib-earlystopping-to-docker && ./result/bin/load-katib-earlystopping-to-docker
```
