# twistlock-defender

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#twistlock-defender

# Load into Docker
nix build .#load-twistlock-defender-to-docker && ./result/bin/load-twistlock-defender-to-docker
```
