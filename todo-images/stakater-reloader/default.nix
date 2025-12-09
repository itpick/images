{ buildCLIImage, pkgs, lib, ... }:

# Image: stakater-reloader
# Reference: https://images.chainguard.dev/directory/image/stakater-reloader/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   stakater-reloader (1.4.10-r0)

# TODO: Implement stakater-reloader image
throw "Image 'stakater-reloader' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "stakater-reloader";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "stakater-reloader";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
