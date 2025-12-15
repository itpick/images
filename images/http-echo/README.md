# http-echo

http-echo is a lightweight Go-based web server that responds to all HTTP requests with a predefined message, making it useful for testing and debugging HTTP interactions

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#http-echo

# Load into Docker
nix build .#load-http-echo-to-docker && ./result/bin/load-http-echo-to-docker
```
