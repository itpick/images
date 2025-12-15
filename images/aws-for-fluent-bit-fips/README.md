# aws-for-fluent-bit-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-for-fluent-bit-fips

# Load into Docker
nix build .#load-aws-for-fluent-bit-fips-to-docker && ./result/bin/load-aws-for-fluent-bit-fips-to-docker
```
