# ntpd-rs

Minimal image with ntpd-rs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#ntpd-rs

# Load into Docker
nix build .#load-ntpd-rs-to-docker && ./result/bin/load-ntpd-rs-to-docker
```
