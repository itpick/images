# sig-storage-local-static-provisioner

Static provisioner of local volumes

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.8.0 |
| Closure Size | 39.95 MB |
| Homepage | https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.sig-storage-local-static-provisioner
}
```
