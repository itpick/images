# thanos

Highly available Prometheus setup with long term storage capabilities

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.40.1 |
| Closure Size | 90.63 MB |
| Homepage | https://thanos.io/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.thanos
}
```
