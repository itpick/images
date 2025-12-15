# orthanc-gdcm

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#orthanc-gdcm

# Load into Docker
nix build .#load-orthanc-gdcm-to-docker && ./result/bin/load-orthanc-gdcm-to-docker
```
