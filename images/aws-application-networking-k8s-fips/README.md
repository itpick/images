# aws-application-networking-k8s-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-application-networking-k8s-fips

# Load into Docker
nix build .#load-aws-application-networking-k8s-fips-to-docker && ./result/bin/load-aws-application-networking-k8s-fips-to-docker
```
