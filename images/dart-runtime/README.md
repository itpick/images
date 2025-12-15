# dart-runtime

Container image for dart programming language

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dart-runtime

# Load into Docker
nix build .#load-dart-runtime-to-docker && ./result/bin/load-dart-runtime-to-docker
```
