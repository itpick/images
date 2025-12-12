# mimir

Grafana Mimir provides horizontally scalable, highly available, multi-tenant, long-term storage for Prometheus

## Package Info

| Property | Value |
|----------|-------|
| Version | 3.0.1 |
| Closure Size | 229.13 MB |
| Homepage | https://grafana.com/oss/mimir/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.mimir
}
```
