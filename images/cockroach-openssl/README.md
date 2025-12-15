# cockroach-openssl

CockroachDB is a cloud-native distributed SQL database designed to build, scale, and manage modern, data-intensive applications. The Cockroach-openssl image is the FIPS enabled equivalent of the standard Cockroach image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cockroach-openssl

# Load into Docker
nix build .#load-cockroach-openssl-to-docker && ./result/bin/load-cockroach-openssl-to-docker
```
