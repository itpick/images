# orthanc-ohif

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#orthanc-ohif

# Load into Docker
nix build .#load-orthanc-ohif-to-docker && ./result/bin/load-orthanc-ohif-to-docker
```
