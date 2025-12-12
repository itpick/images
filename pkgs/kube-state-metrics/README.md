# kube-state-metrics

Generate metrics from Kubernetes API objects

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.17.0 |
| Closure Size | 57.27 MB |
| Homepage | https://github.com/kubernetes/kube-state-metrics |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.kube-state-metrics
}
```
