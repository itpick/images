# contour

Contour is a Kubernetes ingress controller using Envoy proxy

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.33.0 |
| Closure Size | 55.60 MB |
| Homepage | https://projectcontour.io/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.contour
}
```
