# csi-provisioner

Sidecar container that watches Kubernetes PVC objects and triggers CreateVolume/DeleteVolume against CSI endpoint

## Package Info

| Property | Value |
|----------|-------|
| Version | 6.1.0 |
| Closure Size | 65.32 MB |
| Homepage | https://github.com/kubernetes-csi/external-provisioner |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.csi-provisioner
}
```
