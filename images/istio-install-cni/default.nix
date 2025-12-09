# istio-install-cni
# =============
# Placeholder for istio-install-cni container image.
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


# Chainguard SBOM packages for istio-install-cni:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iptables  # iptables (1.8.11-r29)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
# Packages NOT in nixpkgs:
#   ip6tables (1.8.11-r29)
#   istio-cni-1.28 (1.28.1-r0)
#   istio-install-cni-1.28 (1.28.1-r0)
#   ld-linux (2.42-r4)
#   xtables (1.8.11-r29)

throw "Image 'istio-install-cni' is not yet implemented. See default.nix for implementation notes."
