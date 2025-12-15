# tomcat-10.1-openjdk-21-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tomcat-10.1-openjdk-21-fips

# Load into Docker
nix build .#load-tomcat-10.1-openjdk-21-fips-to-docker && ./result/bin/load-tomcat-10.1-openjdk-21-fips-to-docker
```
