# csi-driver-nfs

CSI driver for Kubernetes NFS support

## Package Info

| Property | Value |
|----------|-------|
| Version | 4.12.1 |
| Closure Size | 35.77 MB |
| Homepage | https://github.com/kubernetes-csi/csi-driver-nfs |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.csi-driver-nfs
}
```
