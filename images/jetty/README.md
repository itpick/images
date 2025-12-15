# jetty

Eclipse Jetty is a lightweight, highly scalable, Java-based web server and Servlet engine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jetty

# Load into Docker
nix build .#load-jetty-to-docker && ./result/bin/load-jetty-to-docker
```
