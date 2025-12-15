# dart

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#dart

# Load into Docker
nix build .#load-dart-to-docker && ./result/bin/load-dart-to-docker
```
