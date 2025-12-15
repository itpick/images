# calico-pod2daemon-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#calico-pod2daemon-fips

# Load into Docker
nix build .#load-calico-pod2daemon-fips-to-docker && ./result/bin/load-calico-pod2daemon-fips-to-docker
```
