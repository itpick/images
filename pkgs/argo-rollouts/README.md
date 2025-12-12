# argo-rollouts

Progressive Delivery for Kubernetes

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.8.3 |
| Closure Size | 143.59 MB |
| Homepage | https://argoproj.github.io/argo-rollouts/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.argo-rollouts
}
```
