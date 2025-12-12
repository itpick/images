# trust-manager

Distribute trust bundles across a Kubernetes cluster

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.20.3 |
| Closure Size | 33.64 MB |
| Homepage | https://cert-manager.io/docs/projects/trust-manager/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.trust-manager
}
```
