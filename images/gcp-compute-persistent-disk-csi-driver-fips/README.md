# gcp-compute-persistent-disk-csi-driver-fips

The Google Compute Engine Persistent Disk (GCE PD) Container Storage Interface (CSI) Storage Plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gcp-compute-persistent-disk-csi-driver-fips

# Load into Docker
nix build .#load-gcp-compute-persistent-disk-csi-driver-fips-to-docker && ./result/bin/load-gcp-compute-persistent-disk-csi-driver-fips-to-docker
```
