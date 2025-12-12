# apache-nifi

Apache NiFi was made for dataflow. It supports highly configurable directed graphs of data routing, transformation, and system mediation logic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.73 GB |
| Uncompressed | ~4.32 GB |

## Usage

```bash
# Build the image
nix build .#apache-nifi

# Load into Docker
nix build .#load-apache-nifi-to-docker && ./result/bin/load-apache-nifi-to-docker
```
