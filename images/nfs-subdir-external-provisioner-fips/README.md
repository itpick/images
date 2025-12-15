# nfs-subdir-external-provisioner-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nfs-subdir-external-provisioner-fips

# Load into Docker
nix build .#load-nfs-subdir-external-provisioner-fips-to-docker && ./result/bin/load-nfs-subdir-external-provisioner-fips-to-docker
```
