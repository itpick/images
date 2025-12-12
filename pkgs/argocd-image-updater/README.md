# argocd-image-updater

Automatic container image updater for Argo CD

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.0.1 |
| Closure Size | 79.32 MB |
| Homepage | https://github.com/argoproj-labs/argocd-image-updater |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.argocd-image-updater
}
```
