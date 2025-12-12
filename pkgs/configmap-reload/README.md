# configmap-reload

Simple binary to trigger a reload when a Kubernetes ConfigMap is updated

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.15.0 |
| Closure Size | 10.71 MB |
| Homepage | https://github.com/jimmidyson/configmap-reload |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.configmap-reload
}
```
