# gke-gcloud-auth-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gke-gcloud-auth-plugin

# Load into Docker
nix build .#load-gke-gcloud-auth-plugin-to-docker && ./result/bin/load-gke-gcloud-auth-plugin-to-docker
```
