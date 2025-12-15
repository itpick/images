# filebrowser

Filebrowser provides a file managing interface within a specified directory and it can be used to upload, delete, preview, rename and edit your files

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#filebrowser

# Load into Docker
nix build .#load-filebrowser-to-docker && ./result/bin/load-filebrowser-to-docker
```
