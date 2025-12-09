# k8s-dns-node-cache
# =============
# Placeholder for k8s-dns-node-cache container image.
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


# Chainguard SBOM packages for k8s-dns-node-cache:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libev  # libev (4.33-r9)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nghttp2  # nghttp2 (1.68.0-r0)
#   pkgs.nodejs  # nodejs-25 (25.2.1-r0)
#   pkgs.npm-check  # npm (11.6.4-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

throw "Image 'k8s-dns-node-cache' is not yet implemented. See default.nix for implementation notes."
