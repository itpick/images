# certgen

Certificate generator for Hubble and Cilium

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.3.1 |
| Closure Size | 40.89 MB |
| Homepage | https://github.com/cilium/certgen |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.certgen
}
```
