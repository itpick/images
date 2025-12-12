# apache-nifi

Apache NiFi - an easy to use, powerful, and reliable system to process and distribute data

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.6.0 |
| Closure Size | 1.56 GB |
| Homepage | https://nifi.apache.org/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.apache-nifi
}
```
