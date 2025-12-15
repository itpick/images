# pulumi

Last changed 2 days ago

Request a free trial

Contact our team to test out this image for free.

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#pulumi

# Load into Docker
nix build .#load-pulumi-to-docker && ./result/bin/load-pulumi-to-docker
```
