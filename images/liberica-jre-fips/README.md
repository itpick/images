# liberica-jre-fips

Free and open source Progressive Java Runtime for modern Java deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#liberica-jre-fips

# Load into Docker
nix build .#load-liberica-jre-fips-to-docker && ./result/bin/load-liberica-jre-fips-to-docker
```
