# csi-attacher

Sidecar container that watches Kubernetes VolumeAttachment objects and triggers ControllerPublish/Unpublish against CSI endpoint

## Package Info

| Property | Value |
|----------|-------|
| Version | 4.10.0 |
| Closure Size | 61.44 MB |
| Homepage | https://github.com/kubernetes-csi/external-attacher |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.csi-attacher
}
```
