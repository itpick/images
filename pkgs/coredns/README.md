# coredns

CoreDNS is a DNS server that chains plugins

## Package Info

| Property | Value |
|----------|-------|
| Version | 1.13.2 |
| Closure Size | 70.26 MB |
| Homepage | https://coredns.io/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.coredns
}
```
