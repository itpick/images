# metallb

A network load-balancer implementation for Kubernetes using standard routing protocols

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.15.3 |
| Closure Size | 83.74 MB |
| Homepage | https://metallb.universe.tf/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.metallb
}
```
