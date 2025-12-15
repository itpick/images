# camunda-zeebe

Zeebe is the process automation engine powering Camunda

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#camunda-zeebe

# Load into Docker
nix build .#load-camunda-zeebe-to-docker && ./result/bin/load-camunda-zeebe-to-docker
```
