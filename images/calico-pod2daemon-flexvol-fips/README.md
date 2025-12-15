# calico-pod2daemon-flexvol-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-pod2daemon-flexvol-fips

# Load into Docker
nix build .#load-calico-pod2daemon-flexvol-fips-to-docker && ./result/bin/load-calico-pod2daemon-flexvol-fips-to-docker
```
