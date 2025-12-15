# aws-for-fluent-bit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-for-fluent-bit

# Load into Docker
nix build .#load-aws-for-fluent-bit-to-docker && ./result/bin/load-aws-for-fluent-bit-to-docker
```
