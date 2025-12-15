# sqlpad

A minimal Wolfi-based image for sqlpad, which is a web application for generating and running SQL queries and visualizing the results. For more information, please refer to the applications documentation on github

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sqlpad

# Load into Docker
nix build .#load-sqlpad-to-docker && ./result/bin/load-sqlpad-to-docker
```
