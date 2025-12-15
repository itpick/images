# twistlock-console

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#twistlock-console

# Load into Docker
nix build .#load-twistlock-console-to-docker && ./result/bin/load-twistlock-console-to-docker
```
