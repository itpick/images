# lvm-driver-fips

Dynamically provision Stateful Persistent Node-Local Volumes & Filesystems for Kubernetes that is integrated with a backend LVM2 data storage stack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#lvm-driver-fips

# Load into Docker
nix build .#load-lvm-driver-fips-to-docker && ./result/bin/load-lvm-driver-fips-to-docker
```
