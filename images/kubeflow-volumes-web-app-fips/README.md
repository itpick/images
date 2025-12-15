# kubeflow-volumes-web-app-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubeflow-volumes-web-app-fips

# Load into Docker
nix build .#load-kubeflow-volumes-web-app-fips-to-docker && ./result/bin/load-kubeflow-volumes-web-app-fips-to-docker
```
