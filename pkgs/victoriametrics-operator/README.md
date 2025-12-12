# victoriametrics-operator

Kubernetes operator for VictoriaMetrics

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.66.1 |
| Closure Size | 85.31 MB |
| Homepage | https://github.com/VictoriaMetrics/operator |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.victoriametrics-operator
}
```
