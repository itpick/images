# loki-canary
# =============
# Placeholder for loki-canary container image.
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


# Chainguard SBOM packages for loki-canary:
# Packages NOT in nixpkgs:
#   loki-3.6-loki-canary (3.6.2-r0)

throw "Image 'loki-canary' is not yet implemented. See default.nix for implementation notes."
