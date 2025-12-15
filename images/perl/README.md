# perl

Container image for building Perl applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#perl

# Load into Docker
nix build .#load-perl-to-docker && ./result/bin/load-perl-to-docker
```
