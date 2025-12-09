{ buildCLIImage, pkgs, lib, ... }:

# Image: linkerd-tap
# Reference: https://images.chainguard.dev/directory/image/linkerd-tap/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   linkerd2-tap (25.12.1-r1)

# TODO: Implement linkerd-tap image
throw "Image 'linkerd-tap' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "linkerd-tap";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "linkerd-tap";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
