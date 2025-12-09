# kube-webhook-certgen
# =============
# Placeholder for kube-webhook-certgen container image.
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


# Chainguard SBOM packages for kube-webhook-certgen:
# Packages NOT in nixpkgs:
#   kube-webhook-certgen-1.14 (1.14.1-r0)

throw "Image 'kube-webhook-certgen' is not yet implemented. See default.nix for implementation notes."
