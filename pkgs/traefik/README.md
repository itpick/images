# traefik

The Cloud Native Application Proxy

## Package Info

| Property | Value |
|----------|-------|
| Version | 3.6.4 |
| Closure Size | 154.02 MB |
| Homepage | https://traefik.io/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.traefik
}
```
