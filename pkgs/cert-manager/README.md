# cert-manager

Automatically provision and manage TLS certificates in Kubernetes

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.16.2 |
| Closure Size | 185.75 MB |
| Homepage | https://github.com/cert-manager/cert-manager |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.cert-manager
}
```
