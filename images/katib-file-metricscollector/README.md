# katib-file-metricscollector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#katib-file-metricscollector

# Load into Docker
nix build .#load-katib-file-metricscollector-to-docker && ./result/bin/load-katib-file-metricscollector-to-docker
```
