{ buildCLIImage, pkgs, lib, ... }:

# Image: boring-registry
# Reference: https://images.chainguard.dev/directory/image/boring-registry/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   boring-registry (0.16.6-r4)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement boring-registry image
throw "Image 'boring-registry' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "boring-registry";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "boring-registry";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
