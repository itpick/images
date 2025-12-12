# aws-load-balancer-controller

A Kubernetes controller for Elastic Load Balancers

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.16.0 |
| Closure Size | 80.52 MB |
| Homepage | https://github.com/kubernetes-sigs/aws-load-balancer-controller |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.aws-load-balancer-controller
}
```
