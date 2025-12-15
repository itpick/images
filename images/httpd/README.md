# httpd

httpd, a powerful and flexible HTTP/1.1 compliant web server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#httpd

# Load into Docker
nix build .#load-httpd-to-docker && ./result/bin/load-httpd-to-docker
```
