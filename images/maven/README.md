# maven

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#maven

# Load into Docker
nix build .#load-maven-to-docker && ./result/bin/load-maven-to-docker
```
