# liberica-jre

Free and open source Progressive Java Runtime for modern Java deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#liberica-jre

# Load into Docker
nix build .#load-liberica-jre-to-docker && ./result/bin/load-liberica-jre-to-docker
```
