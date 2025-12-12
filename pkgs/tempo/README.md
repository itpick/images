# tempo

Grafana Tempo is a high volume, minimal dependency distributed tracing backend

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.9.0 |
| Closure Size | 222.94 MB |
| Homepage | https://grafana.com/oss/tempo/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.tempo
}
```
