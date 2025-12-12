# crossplane

Cloud Native Control Plane

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.1.3 |
| Closure Size | 67.14 MB |
| Homepage | https://crossplane.io/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.crossplane
}
```
