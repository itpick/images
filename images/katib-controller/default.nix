# katib-controller
# =============
# Placeholder for katib-controller container image.
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


# Chainguard SBOM packages for katib-controller:
# Packages NOT in nixpkgs:
#   katib-controller (0.19.0-r2)

throw "Image 'katib-controller' is not yet implemented. See default.nix for implementation notes."
