# dependency-track

Dependency Track Dependency-Track is an intelligent Component Analysis platform that allows organizations to identify and reduce risk in the software supply chain

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dependency-track

# Load into Docker
nix build .#load-dependency-track-to-docker && ./result/bin/load-dependency-track-to-docker
```
