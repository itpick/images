# cluster-proportional-autoscaler

Container autoscaler based on cluster size

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.9.0 |
| Closure Size | 43.50 MB |
| Homepage | https://github.com/kubernetes-sigs/cluster-proportional-autoscaler |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.cluster-proportional-autoscaler
}
```
