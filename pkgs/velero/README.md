# velero

Backup and migrate Kubernetes applications and their persistent volumes

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.17.1 |
| Closure Size | 90.86 MB |
| Homepage | https://velero.io/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.velero
}
```
