# orthanc-python

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#orthanc-python

# Load into Docker
nix build .#load-orthanc-python-to-docker && ./result/bin/load-orthanc-python-to-docker
```
