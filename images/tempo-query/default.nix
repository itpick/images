# tempo-query
# =============
# Placeholder for tempo-query container image.
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


# Chainguard SBOM packages for tempo-query:
# Packages available in nixpkgs:
#   pkgs.tempo  # tempo (2.9.0-r3)

throw "Image 'tempo-query' is not yet implemented. See default.nix for implementation notes."
