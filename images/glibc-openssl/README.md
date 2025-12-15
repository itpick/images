# glibc-openssl

The GNU C Library (glibc) is a C standard library implementation maintained by the GNU Project. This container image also contains OpenSSL, a software library for applications providing secure communications over a network

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#glibc-openssl

# Load into Docker
nix build .#load-glibc-openssl-to-docker && ./result/bin/load-glibc-openssl-to-docker
```
