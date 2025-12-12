# prometheus-adapter

An implementation of the custom.metrics.k8s.io API using Prometheus

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.12.0 |
| Closure Size | 57.13 MB |
| Homepage | https://github.com/kubernetes-sigs/prometheus-adapter |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.prometheus-adapter
}
```
