# squid-proxy

Squid Proxy is an open-source, high-performance, and highly configurable caching and forwarding web proxy. It is widely used for speeding up web servers by caching web, DNS, and other computer network lookups for a group of people sharing network resources, and for aiding security by filtering traffic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#squid-proxy

# Load into Docker
nix build .#load-squid-proxy-to-docker && ./result/bin/load-squid-proxy-to-docker
```
