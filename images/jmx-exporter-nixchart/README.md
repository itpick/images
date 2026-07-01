# jmx-exporter-nixchart

JMX Exporter is a general-purpose minimal image, used by Iamguarded Helm Charts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jmx-exporter-nixchart

# Load into Docker
nix build .#load-jmx-exporter-nixchart-to-docker && ./result/bin/load-jmx-exporter-nixchart-to-docker
```
