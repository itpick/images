# fluent-bit

Fluent Bit is a lightweight and high performance log processor

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 309.52 MB |
| Uncompressed | ~773.81 MB |

## Usage

```bash
# Build the image
nix build .#fluent-bit

# Load into Docker
nix build .#load-fluent-bit-to-docker && ./result/bin/load-fluent-bit-to-docker
```
