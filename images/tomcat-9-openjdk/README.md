# tomcat-9-openjdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tomcat-9-openjdk

# Load into Docker
nix build .#load-tomcat-9-openjdk-to-docker && ./result/bin/load-tomcat-9-openjdk-to-docker
```
