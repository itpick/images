# csi-driver-smb

CSI driver for Kubernetes SMB support

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.19.1 |
| Closure Size | 45.01 MB |
| Homepage | https://github.com/kubernetes-csi/csi-driver-smb |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.csi-driver-smb
}
```
