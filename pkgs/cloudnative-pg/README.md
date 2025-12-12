# cloudnative-pg

CloudNativePG is a comprehensive platform designed to manage PostgreSQL databases within Kubernetes

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.27.1 |
| Closure Size | 59.96 MB |
| Homepage | https://github.com/cloudnative-pg/cloudnative-pg |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.cloudnative-pg
}
```
