# hubble-export-stdout

hubble-export-stdout exports Hubble data to stdout

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#hubble-export-stdout

# Load into Docker
nix build .#load-hubble-export-stdout-to-docker && ./result/bin/load-hubble-export-stdout-to-docker
```
