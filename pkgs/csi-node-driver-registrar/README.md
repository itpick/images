# csi-node-driver-registrar

Sidecar container that registers a CSI driver with the kubelet

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.15.0 |
| Closure Size | 20.09 MB |
| Homepage | https://github.com/kubernetes-csi/node-driver-registrar |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.csi-node-driver-registrar
}
```
