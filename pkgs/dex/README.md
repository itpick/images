# dex

OpenID Connect (OIDC) identity and OAuth 2.0 provider

## Package Info

| Property | Value |
|----------|-------|
| Version | 2.44.0 |
| Closure Size | 33.05 MB |
| Homepage | https://dexidp.io/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.dex
}
```
