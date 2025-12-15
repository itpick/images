# nemo

NVIDIA NeMo Framework is an end-to-end, cloud-native framework to build, customize, and deploy generative AI models anywhere

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nemo

# Load into Docker
nix build .#load-nemo-to-docker && ./result/bin/load-nemo-to-docker
```
