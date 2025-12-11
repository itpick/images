# bento

Bento is a high performance and resilient stream processor, able to connect various sources and sinks in a range of brokering patterns and perform hydration, enrichments, transformations and filters on payloads

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 11s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#bento

# Load into Docker
nix build .#load-bento-to-docker && ./result/bin/load-bento-to-docker
```
