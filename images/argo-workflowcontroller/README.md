# argo-workflowcontroller

## Image Size

| Type | Size |
|------|------|
| Compressed | 171.03 MB |
| Uncompressed | ~427.59 MB |

## Usage

```bash
# Build the image
nix build .#argo-workflowcontroller

# Load into Docker
nix build .#load-argo-workflowcontroller-to-docker && ./result/bin/load-argo-workflowcontroller-to-docker
```
