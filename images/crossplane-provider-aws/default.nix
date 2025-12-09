# crossplane-provider-aws
# =============
# Placeholder for crossplane-provider-aws container image.
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


# Chainguard SBOM packages for crossplane-provider-aws:
# Packages available in nixpkgs:
#   pkgs.crossplane  # crossplane-2.1 (2.1.3-r1)

throw "Image 'crossplane-provider-aws' is not yet implemented. See default.nix for implementation notes."
