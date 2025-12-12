# metrics-server

Scalable and efficient source of container resource metrics

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.8.0 |
| Closure Size | 64.99 MB |
| Homepage | https://github.com/kubernetes-sigs/metrics-server |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.metrics-server
}
```
