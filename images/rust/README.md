# rust

Minimal Wolfi-based Rust image for building Rust applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#rust

# Load into Docker
nix build .#load-rust-to-docker && ./result/bin/load-rust-to-docker
```
