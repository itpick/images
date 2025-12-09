# mattermost
# =============
# Placeholder for mattermost container image.
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


# Chainguard SBOM packages for mattermost:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.mattermost  # mattermost-11.1 (11.1.1-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

throw "Image 'mattermost' is not yet implemented. See default.nix for implementation notes."
