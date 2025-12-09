# velero-plugin-aws
# =============
# Placeholder for velero-plugin-aws container image.
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


# Chainguard SBOM packages for velero-plugin-aws:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.restic  # restic (0.18.1-r2)
#   pkgs.velero  # velero (1.17.1-r2)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   velero-restore-helper (1.17.1-r2)

throw "Image 'velero-plugin-aws' is not yet implemented. See default.nix for implementation notes."
