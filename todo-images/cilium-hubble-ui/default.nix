{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-hubble-ui
# Reference: https://images.chainguard.dev/directory/image/cilium-hubble-ui/overview

# Packages available in nixpkgs:
#   pkgs.execline  # execline (2.9.7.0-r51)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.s6  # s6 (2.13.2.0-r51)
#   pkgs.skalibs  # skalibs (2.14.4.0-r51)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   hubble-ui (0.13.3-r2)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   nginx-mainline-config (1.29.3-r0)

# TODO: Implement cilium-hubble-ui image
throw "Image 'cilium-hubble-ui' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.execline;
#   name = "cilium-hubble-ui";
#   tag = "v${pkgs.execline.version}";
#   entrypoint = [ "${pkgs.execline}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-hubble-ui";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
