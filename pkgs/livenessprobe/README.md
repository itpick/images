# livenessprobe

A sidecar container that can be included in CSI driver pods to enable liveness probe

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.17.0 |
| Closure Size | 20.34 MB |
| Homepage | https://github.com/kubernetes-csi/livenessprobe |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.livenessprobe
}
```
