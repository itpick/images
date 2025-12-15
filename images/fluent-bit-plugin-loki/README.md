# fluent-bit-plugin-loki

The Fluent Bit Loki plugin allows you to send your log or events to a Loki service

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluent-bit-plugin-loki

# Load into Docker
nix build .#load-fluent-bit-plugin-loki-to-docker && ./result/bin/load-fluent-bit-plugin-loki-to-docker
```
