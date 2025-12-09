# harbor-jobservice
# =============
# Placeholder for harbor-jobservice container image.
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


# Chainguard SBOM packages for harbor-jobservice:
# Packages NOT in nixpkgs:
#   harbor-2.14-jobservice (2.14.1-r1)

throw "Image 'harbor-jobservice' is not yet implemented. See default.nix for implementation notes."
