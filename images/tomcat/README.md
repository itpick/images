# tomcat

Tomcat is a free and open-source implementation of the Jakarta Servlet, Jakarta Expression Language, and WebSocket technologies

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#tomcat

# Load into Docker
nix build .#load-tomcat-to-docker && ./result/bin/load-tomcat-to-docker
```
