# coredns-fips

A minimal FIPS image of CoreDNS for secure and flexible DNS-based service discovery in kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#coredns-fips

# Load into Docker
nix build .#load-coredns-fips-to-docker && ./result/bin/load-coredns-fips-to-docker
```
