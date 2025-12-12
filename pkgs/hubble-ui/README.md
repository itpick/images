# hubble-ui

Hubble UI backend service

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.13.3 |
| Closure Size | 62.77 MB |
| Homepage | https://github.com/cilium/hubble-ui |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.hubble-ui
}
```
