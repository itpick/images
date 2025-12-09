{ buildCLIImage, pkgs, lib, ... }:

# Image: whereabouts
# Reference: https://images.chainguard.dev/directory/image/whereabouts/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   whereabouts (0.9.2-r3)

# TODO: Implement whereabouts image
throw "Image 'whereabouts' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "whereabouts";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "whereabouts";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
