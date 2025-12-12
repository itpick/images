# trivy

Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more

## Package Info

| Property | Value |
|----------|-------|
| Version | 0.68.1 |
| Closure Size | 96 B |
| Homepage | https://trivy.dev/ |

## Usage

This package is used internally by container images. To use it directly:

```nix
{ pkgs, ... }:

let
  customPkgs = import ./pkgs { inherit pkgs; };
in
{
  # Use customPkgs.trivy
}
```
