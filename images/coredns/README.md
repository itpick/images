# coredns

A minimal image of CoreDNS for secure and flexible DNS-based service discovery in kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 186.07 MB |
| Uncompressed | ~465.19 MB |

## Usage

```bash
# Build the image
nix build .#coredns

# Load into Docker
nix build .#load-coredns-to-docker && ./result/bin/load-coredns-to-docker
```
