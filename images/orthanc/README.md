# orthanc

Lightweight DICOM server for medical imaging with RESTful API and web interface

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#orthanc

# Load into Docker
nix build .#load-orthanc-to-docker && ./result/bin/load-orthanc-to-docker
```
