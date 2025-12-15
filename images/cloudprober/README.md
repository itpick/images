# cloudprober

Cloudprober is a monitoring software that makes it super-easy to monitor availability and performance of various components of your system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cloudprober

# Load into Docker
nix build .#load-cloudprober-to-docker && ./result/bin/load-cloudprober-to-docker
```
