# kiali
# =============
# Placeholder for kiali container image.
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


# Chainguard SBOM packages for kiali:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ca-certificates (20251003-r0)
#   kiali (2.19.0-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)

throw "Image 'kiali' is not yet implemented. See default.nix for implementation notes."
