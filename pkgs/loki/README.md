# loki

Like Prometheus, but for logs

## Package Info

| Property | Value |
|----------|-------|
| Version | 3.6.3 |
| Closure Size | 315.36 MB |
| Homepage | https://grafana.com/oss/loki/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.loki
}
```
