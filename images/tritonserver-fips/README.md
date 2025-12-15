# tritonserver-fips

The Triton Inference Server provides an optimized cloud and edge inferencing solution

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tritonserver-fips

# Load into Docker
nix build .#load-tritonserver-fips-to-docker && ./result/bin/load-tritonserver-fips-to-docker
```
