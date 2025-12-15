# docbook-xml

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#docbook-xml

# Load into Docker
nix build .#load-docbook-xml-to-docker && ./result/bin/load-docbook-xml-to-docker
```
