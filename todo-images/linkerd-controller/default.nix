{ buildCLIImage, pkgs, lib, ... }:

# Image: linkerd-controller
# Reference: https://images.chainguard.dev/directory/image/linkerd-controller/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   linkerd2-controller (25.12.1-r1)

# TODO: Implement linkerd-controller image
throw "Image 'linkerd-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "linkerd-controller";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "linkerd-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
