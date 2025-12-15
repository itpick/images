# orthanc-postgresql

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#orthanc-postgresql

# Load into Docker
nix build .#load-orthanc-postgresql-to-docker && ./result/bin/load-orthanc-postgresql-to-docker
```
