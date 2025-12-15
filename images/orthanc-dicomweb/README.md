# orthanc-dicomweb

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#orthanc-dicomweb

# Load into Docker
nix build .#load-orthanc-dicomweb-to-docker && ./result/bin/load-orthanc-dicomweb-to-docker
```
