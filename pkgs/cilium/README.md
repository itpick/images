# cilium

eBPF-based Networking, Security, and Observability

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.18.4 |
| Closure Size | 601.42 MB |
| Homepage | https://cilium.io |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.cilium
}
```
