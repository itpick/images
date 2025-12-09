{ buildCLIImage, pkgs, lib, ... }:

# Image: spiffe-helper
# Reference: https://images.chainguard.dev/directory/image/spiffe-helper/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.spiffe-helper  # spiffe-helper (0.11.0-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement spiffe-helper image
throw "Image 'spiffe-helper' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.spiffe-helper;
#   name = "spiffe-helper";
#   tag = "v${pkgs.spiffe-helper.version}";
#   entrypoint = [ "${pkgs.spiffe-helper}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "spiffe-helper";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
