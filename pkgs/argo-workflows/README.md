# argo-workflows

Container native workflow engine for Kubernetes

## Package Info

| Property | Value |
|----------|-------|
| Version | 3.6.4 |
| Closure Size | 210.24 MB |
| Homepage | https://argoproj.github.io/argo-workflows/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.argo-workflows
}
```
