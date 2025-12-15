# tritonserver-pytorch-backend-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-pytorch-backend-fips

# Load into Docker
nix build .#load-tritonserver-pytorch-backend-fips-to-docker && ./result/bin/load-tritonserver-pytorch-backend-fips-to-docker
```
