# kube-scheduler-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-scheduler-fips

# Load into Docker
nix build .#load-kube-scheduler-fips-to-docker && ./result/bin/load-kube-scheduler-fips-to-docker
```
