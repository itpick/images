# victoriametrics-cluster

VictoriaMetrics ${name} - cluster component

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.131.0 |
| Closure Size | 37.43 MB |
| Homepage | https://victoriametrics.com/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.victoriametrics-cluster
}
```
