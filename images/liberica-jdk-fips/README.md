# liberica-jdk-fips

Free and open source Progressive Java Runtime for modern Java deployments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#liberica-jdk-fips

# Load into Docker
nix build .#load-liberica-jdk-fips-to-docker && ./result/bin/load-liberica-jdk-fips-to-docker
```
