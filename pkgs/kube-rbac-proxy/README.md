# kube-rbac-proxy

Kubernetes RBAC authorizing HTTP proxy

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.20.1 |
| Closure Size | 96 B |
| Homepage | https://github.com/brancz/kube-rbac-proxy |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.kube-rbac-proxy
}
```
