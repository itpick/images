# tomcat-11.0-openjdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tomcat-11.0-openjdk

# Load into Docker
nix build .#load-tomcat-11.0-openjdk-to-docker && ./result/bin/load-tomcat-11.0-openjdk-to-docker
```
