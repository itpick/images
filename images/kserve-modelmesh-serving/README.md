# kserve-modelmesh-serving

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kserve-modelmesh-serving

# Load into Docker
nix build .#load-kserve-modelmesh-serving-to-docker && ./result/bin/load-kserve-modelmesh-serving-to-docker
```
