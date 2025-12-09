{ buildCLIImage, pkgs, lib, ... }:

# Image: flux-notification-controller
# Reference: https://images.chainguard.dev/directory/image/flux-notification-controller/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   flux-notification-controller (1.7.5-r3)
#   ld-linux (2.42-r4)

# TODO: Implement flux-notification-controller image
throw "Image 'flux-notification-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "flux-notification-controller";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux-notification-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
