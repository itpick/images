# loki-helm-test
# =============
# Placeholder for loki-helm-test container image.
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


# Chainguard SBOM packages for loki-helm-test:
# Packages available in nixpkgs:
#   pkgs.helm  # helm-4 (4.0.1-r2)

throw "Image 'loki-helm-test' is not yet implemented. See default.nix for implementation notes."
