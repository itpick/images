# csi-resizer

Sidecar container that watches Kubernetes PVC objects and triggers ControllerExpandVolume against CSI endpoint

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.0.0 |
| Closure Size | 61.62 MB |
| Homepage | https://github.com/kubernetes-csi/external-resizer |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.csi-resizer
}
```
