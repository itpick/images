# harbor-registryctl
# =============
# Placeholder for harbor-registryctl container image.
# This image is referenced in Helm charts but not yet implemented.
#
# TODO: Implement this image
# Reference: Check chart-images.json for source image details
#
# Example patterns to follow:
#   - Go binary: See images/external-dns/default.nix
#   - nixpkgs package: See images/kubectl/default.nix
#   - Java app: See images/jdk/default.nix

{ ... }:


# Chainguard SBOM packages for harbor-registryctl:
# Packages NOT in nixpkgs:
#   harbor-2.14-registryctl (2.14.1-r1)
#   harbor-registry (3.0.0-r13)

throw "Image 'harbor-registryctl' is not yet implemented. See default.nix for implementation notes."
