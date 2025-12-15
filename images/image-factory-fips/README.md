# image-factory-fips

Image Factory is a flexible artifact-build service for Talos Linux, offering automated creation of ISOs, disks, cloud images, and installers and ensuring reproductible builds

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#image-factory-fips

# Load into Docker
nix build .#load-image-factory-fips-to-docker && ./result/bin/load-image-factory-fips-to-docker
```
